defmodule PrometheusCollectorTelemetryConverter do
  @moduledoc """
  Executes a prometheus.erl collector and converts the output to `:telemetry` events.
  """

  def collect(collector, registry \\ :default) do
    table = String.to_atom("#{collector}__#{registry}__aggregates")
    maybe_create_ets(table)

    collector.collect_mf(registry, &execute(table, &1))
  end

  defp maybe_create_ets(name) do
    case :ets.info(name) do
      :undefined ->
        :ets.new(name, [:named_table, :public, :set, {:write_concurrency, true}])

      _ ->
        :ok
    end
  end

  defp execute(table, {:MetricFamily, metric_family, _description, _, data}) do
    event_name =
      for part <- metric_family,
          do:
            part
            |> to_string()
            |> String.replace_suffix("_", "")
            |> String.to_atom()

    Enum.each(data, fn
      {:Metric, meta, _, {:Counter, value}, _, _, _, _} ->
        key = {event_name, meta}

        diff =
          case :ets.lookup(table, key) do
            [] -> value
            [agg] -> value - elem(agg, 1)
          end

        _ = :ets.update_counter(table, key, diff, {key, 0})
        do_execute(event_name, diff, meta)

      {:Metric, meta, _, _, _, {:Untyped, value}, _, _} ->
        do_execute(event_name, value, meta)

      {:Metric, meta, {:Gauge, value}, _, _, _, _, _} ->
        do_execute(event_name, value, meta)
    end)
  end

  defp execute(_, _), do: {:error, "unknown metric"}

  defp do_execute(event_name, value, meta) do
    meta = for {:LabelPair, key, value} <- meta, into: %{}, do: {String.to_atom(key), value}

    :telemetry.execute(
      event_name,
      %{List.last(event_name) => value},
      meta
    )
  end
end
