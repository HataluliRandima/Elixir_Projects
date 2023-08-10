defmodule ProcessMonitor do
  def explode, do: exit(:Bombed)

  def run do
    spawn_monitor(ProcessMonitor, :explode, [])

   receive do
    {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")

   end

  end
end

# To run
# ProcessMonitor.run
