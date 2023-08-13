defmodule WorkerSupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      {WorkerA, []},
      {WorkerB, []}
    ]

    opts = [strategy: :one_for_all, name: WorkerSupervisor]
    Supervisor.init(children, opts)
  end
end
# For running use the following steps


# WorkerSupervisor.start_link([])
# WorkerA.increment()
# WorkerB.increment()
# Supervisor.which_children(WorkerSupervisor)
# Process.exit(pid, :shutdown)
# Supervisor.which_children(WorkerSupervisor)
# WorkerA.increment()
# WorkerA.get_state()
# WorkerB.increment()
# WorkerB.get_state()
