defmodule PrometheusCollectorTelemetryConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :prometheus_collector_telemetry_converter,
      version: "0.1.0",
      description: "Converts prometheus.erl collectors to telemetry events",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def package do
    %{
      licenses: ["MIT"],
      links: %{
        "GitHub" =>
          "https://github.com/soundtrackyourbrand/prometheus-collector-telemetry-converter"
      }
    }
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:telemetry_metrics, "~> 0.3"},
      {:telemetry, "~> 0.4"},
      {:ex_doc, "~> 0.21", only: :dev}
    ]
  end
end
