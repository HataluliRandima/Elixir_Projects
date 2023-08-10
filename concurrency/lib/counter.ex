defmodule Counter do


    use GenServer

    # Client API
    def start_link(initial_count) do
      GenServer.start_link(__MODULE__, initial_count)
    end

    def increment(pid) do
      GenServer.cast(pid, :increment)
    end

    def value(pid) do
      GenServer.call(pid, :value)
    end

    # Server Callbacks
    def handle_cast(:increment, count) do
      {:noreply, count + 1}
    end

    def handle_call(:value, _from, count) do
      {:reply, count, count}
    end
  end

  # Usage
  # {:ok, pid} = Counter.start_link(0)
  # Counter.increment(pid)
  # IO.puts(Counter.value(pid)) # Outputs 1
