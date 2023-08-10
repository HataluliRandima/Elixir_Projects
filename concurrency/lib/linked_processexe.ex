defmodule LinkedProcessexe do
  # Insteda this we can use the iex way for all of this will show code below below

  def start_link(messagepass) do
   link = spawn_link(fn -> loop() end)
     send_message(link, messagepass)

   IO.inspect terminate_process(link)
  end

  def loop do
    receive do
      :exit -> exit(:normal)
      {:ok, msg} -> IO.puts("Hello hat #{msg}a")
      msg -> IO.puts("Received: #{msg}")
      {:terminate} ->
        IO.puts("Terminating linked process.")
      _ -> IO.puts("NOO")
        loop()
    end
  end

  def send_message(pid, messages) do
    send(pid, {:ok, messages})
  end

  def terminate_process(process_pid) do
    send(process_pid, {:terminate})
  end
end

# defmodule LinkedProcess do
#   def loop do
#     receive do
#       {:message, msg} ->
#         IO.puts("Received message: #{msg}")
#         loop()

#       {:terminate} ->
#         IO.puts("Terminating linked process.")
#     end
#   end

#   def send_message(process_pid, message) do
#     send(process_pid, {:message, message})
#   end

#   def terminate_process(process_pid) do
#     send(process_pid, {:terminate})
#   end
# end


#### IEX PART ###

# Spawn the linked process
# {:ok, linked_process_pid} = spawn_link(LinkedProcess, :loop, [])

# # Send messages to the linked process
# LinkedProcess.send_message(linked_process_pid, "Hello, process!")
# LinkedProcess.send_message(linked_process_pid, "How are you?")
# LinkedProcess.send_message(linked_process_pid, "Ready to terminate?")

# # Terminate the linked process
# LinkedProcess.terminate_process(linked_process_pid)

# # Wait a bit to observe the process termination
# :timer.sleep(1000)
# IO.puts("Main process finished.")
