# PrometheusCollectorTelemetryConverter

Converts the output of a [prometheus.erl](https://github.com/deadtrickster/prometheus.erl) collector to `:telemetry` events so they can be used with [`telemetry_poller`](https://github.com/beam-telemetry/telemetry_poller)

## Installation

```elixir
def deps do
  [
    {:prometheus_collector_telemetry_converter, "~> 0.1.0"}
  ]
end
```

## Usage
Add the `:telemetry_poller` to your applications supervisor tree
```elixir
defmodule MyApp.Application do
  use Application

  def start(_type, _args) do
    children = [
      {:telemetry_poller,
       measurements: [
         {PrometheusCollectorTelemetryConverter, :collect,
          [:prometheus_vm_system_info_collector]},
         {PrometheusCollectorTelemetryConverter, :collect, [:prometheus_vm_statistics_collector]},
         {PrometheusCollectorTelemetryConverter, :collect, [:prometheus_vm_memory_collector]}
       ]}
    ]

    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

```


## Telemetry.Metrics
There are some ready made `Telemetry.Metrics` measurements that triest to mimic `prometheus.erl` as closely as possible.

So far the metrics from `:prometheus_vm_system_info_collector`, `:prometheus_vm_statistics_collector` and `:prometheus_vm_memory_collector` have been added, but adding more should be pretty simple. 

TelemetryMetricsPrometheus doesn't support exposing `last_value` as counters (only as gauges), so this module will cache the last value of counter values reported by the prometheus.erl collector, and emit the diff between the current value and the last value. That way we can use `sum` instead, and they will be exposed as counters.
