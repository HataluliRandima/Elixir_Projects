defmodule WorkerB do

  use GenServer

  # Client API
  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def increment do
    GenServer.call(__MODULE__, :increment)
  end

  def get_state do
    GenServer.call(__MODULE__, :get_state)
  end

  # Server side
  def handle_call(:increment, _from, state) do
    {:reply, :ok, state + 1}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

end
