defmodule PrometheusCollectorTelemetryConverter.Reporter do
  import Telemetry.Metrics

  def metrics() do
    [
      last_value("erlang_vm.allocators",
        description:
          "Allocated (carriers_size) and used (blocks_size) memory for the different allocators in the VM. See erts_alloc(3).",
        event_name: "erlang_vm.allocators",
        tags: [:alloc, :instance_no, :kind, :usage]
      ),
      last_value("erlang_vm.dirty_cpu_schedulers",
        description: "The number of scheduler dirty CPU scheduler threads used by the emulator.",
        event_name: "erlang_vm.dirty_cpu_schedulers"
      ),
      last_value("erlang_vm.dirty_cpu_schedulers_online",
        description: "The number of dirty CPU scheduler threads online.",
        event_name: "erlang_vm.dirty_cpu_schedulers_online"
      ),
      last_value("erlang_vm.dirty_io_schedulers",
        description: "The number of scheduler dirty I/O scheduler threads used by the emulator.",
        event_name: "erlang_vm.dirty_io_schedulers"
      ),
      last_value("erlang_vm.ets_limit",
        description: "The maximum number of ETS tables allowed.",
        event_name: "erlang_vm.ets_limit"
      ),
      last_value("erlang_vm.logical_processors",
        description: "The detected number of logical processors configured in the system.",
        event_name: "erlang_vm.logical_processors"
      ),
      last_value("erlang_vm.logical_processors_available",
        description:
          "The detected number of logical processors available to the Erlang runtime system.",
        event_name: "erlang_vm.logical_processors_available"
      ),
      last_value("erlang_vm.logical_processors_online",
        description: "The detected number of logical processors online on the system.",
        event_name: "erlang_vm.logical_processors_online"
      ),
      last_value("erlang_vm.port_count",
        description: "The number of ports currently existing at the local node.",
        event_name: "erlang_vm.port_count"
      ),
      last_value("erlang_vm.port_limit",
        description: "The maximum number of simultaneously existing ports at the local node.",
        event_name: "erlang_vm.port_limit"
      ),
      last_value("erlang_vm.process_count",
        description: "The number of processes currently existing at the local node.",
        event_name: "erlang_vm.process_count"
      ),
      last_value("erlang_vm.process_limit",
        description: "The maximum number of simultaneously existing processes at the local node.",
        event_name: "erlang_vm.process_limit"
      ),
      last_value("erlang_vm.schedulers",
        description: "The number of scheduler threads used by the emulator.",
        event_name: "erlang_vm.schedulers"
      ),
      last_value("erlang_vm.schedulers_online",
        description: "The number of schedulers online.",
        event_name: "erlang_vm.schedulers_online"
      ),
      last_value("erlang_vm.thread_pool_size",
        description:
          "The number of async threads in the async thread pool used for asynchronous driver calls.",
        event_name: "erlang_vm.thread_pool_size"
      ),
      last_value("erlang_vm.atom_count",
        description: "The number of atom currently existing at the local node.",
        event_name: "erlang_vm.atom_count"
      ),
      last_value("erlang_vm.atom_limit",
        description: "The maximum number of simultaneously existing atom at the local node.",
        event_name: "erlang_vm.atom_limit"
      ),
      last_value("erlang_vm_memory.atom_bytes_total",
        description:
          "The total amount of memory currently allocated for atoms. This memory is part of the memory presented as system memory.",
        event_name: "erlang_vm_memory.atom_bytes_total",
        tags: [:usage]
      ),
      last_value("erlang_vm_memory.bytes_total",
        description:
          "The total amount of memory currently allocated. This is the same as the sum of the memory size for processes and system.",
        event_name: "erlang_vm_memory.bytes_total",
        tags: [:kind]
      ),
      last_value("erlang_vm_memory.dets_tables",
        description: "Erlang VM DETS Tables count.",
        event_name: "erlang_vm_memory.dets_tables"
      ),
      last_value("erlang_vm_memory.ets_tables",
        description: "Erlang VM ETS Tables count.",
        event_name: "erlang_vm_memory.ets_tables"
      ),
      last_value("erlang_vm_memory.processes_bytes_total",
        description: "The total amount of memory currently allocated for the Erlang processes.",
        event_name: "erlang_vm_memory.processes_bytes_total",
        tags: [:usage]
      ),
      last_value("erlang_vm_memory.system_bytes_total",
        description:
          "The total amount of memory currently allocated for the emulator that is not directly related to any Erlang process. Memory presented as processes is not included in this memory.",
        event_name: "erlang_vm_memory.system_bytes_total",
        tags: [:usage]
      ),
      sum("erlang_vm_statistics.dirty_cpu_run_queue_length",
        description: "Length of the dirty CPU run-queue.",
        event_name: "erlang_vm_statistics.dirty_cpu_run_queue_length"
      ),
      sum("erlang_vm_statistics.dirty_io_run_queue_length",
        description: "Length of the dirty IO run-queue.",
        event_name: "erlang_vm_statistics.dirty_io_run_queue_length"
      ),
      sum("erlang_vm_statistics.run_queues_length_total",
        description: "Length of normal run-queues.",
        event_name: "erlang_vm_statistics.run_queues_length_total"
      ),
      sum("erlang_vm_statistics.bytes_output_total",
        description: "Total number of bytes output to ports.",
        event_name: "erlang_vm_statistics.bytes_output_total"
      ),
      sum("erlang_vm_statistics.bytes_received_total",
        description: "Total number of bytes received through ports.",
        event_name: "erlang_vm_statistics.bytes_received_total"
      ),
      sum("erlang_vm_statistics.context_switches",
        description: "Total number of context switches since the system started.",
        event_name: "erlang_vm_statistics.context_switches"
      ),
      sum("erlang_vm_statistics.garbage_collection_number_of_gcs",
        description: "Garbage collection: number of GCs.",
        event_name: "erlang_vm_statistics.garbage_collection_number_of_gcs"
      ),
      sum("erlang_vm_statistics.garbage_collection_bytes_reclaimed",
        description: "Garbage collection: bytes reclaimed.",
        event_name: "erlang_vm_statistics.garbage_collection_bytes_reclaimed"
      ),
      sum("erlang_vm_statistics.garbage_collection_words_reclaimed",
        description: "Garbage collection: words reclaimed.",
        event_name: "erlang_vm_statistics.garbage_collection_words_reclaimed"
      ),
      sum("erlang_vm_statistics.reductions_total",
        description: "Total reductions.",
        event_name: "erlang_vm_statistics.reductions_total"
      ),
      sum("erlang_vm_statistics.runtime_milliseconds",
        description:
          "The sum of the runtime for all threads in the Erlang runtime system. Can be greater than wall clock time.",
        event_name: "erlang_vm_statistics.runtime_milliseconds"
      ),
      sum("erlang_vm_statistics.wallclock_time_milliseconds",
        description:
          "Information about wall clock. Same as erlang_vm_statistics_runtime_milliseconds except that real time is measured.",
        event_name: "erlang_vm_statistics.wallclock_time_milliseconds"
      ),

      # these where exposed as untyped, will there be a problem tha they are now gauges?
      last_value("erlang_vm.smp_support",
        description: "1 if the emulator has been compiled with SMP support, otherwise 0.",
        event_name: "erlang_vm.smp_support"
      ),
      last_value("erlang_vm.threads",
        description: "1 if the emulator has been compiled with thread support, otherwise 0.",
        event_name: "erlang_vm.threads"
      ),
      last_value("erlang_vm.time_correction",
        description: "1 if time correction is enabled, otherwise 0.",
        event_name: "erlang_vm.time_correction"
      )
    ]
  end
end
