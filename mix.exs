defmodule PrometheusCollectorTelemetryConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :prometheus_collector_telemetry_converter,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:telemetry_metrics, "~> 0.3"},
      {:telemetry, "~> 0.4"}
    ]
  end
end
