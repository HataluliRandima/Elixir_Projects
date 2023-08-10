# To demostrate message passing
defmodule Greeter do

  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:greet, name} ->

        IO.puts("ICOU shuma")
        # to continue listning to messages we call our funct
        # doing some recursive thing

        loop()
    end
# whats the different when you put that function outside the receive block
  end

  # Function for exercise 1 for the sending some diffrent message to the process
  def exercise1 do
    receive do
      {:Good_Morning, value} ->
        loop()
      {:Good_Evening, value} ->
        loop()
    end

  end
end


# To test it
# pid = Greeter.start()
# send(pid, {:greet, "Hataluli})

## Steps explaning the code

# Spawning the Process: When Greeter.start() is called, it spawns a new process running the loop function. This allows the process to run independently and concurrently with other processes.

# Receiving Messages: The spawned process enters a waiting state inside the loop function, expecting to receive messages that match the pattern {:greet, name}.

# Handling Messages: When a message with the correct pattern is sent to the process (e.g., send pid, {:greet, "Alice"}), the receive block inside the loop function matches it, and the corresponding code is executed. In this case, it prints "Hello, Alice!" to the console.

# Recursion: After handling a message, the loop function calls itself recursively. This enables the process to continue waiting for and handling additional messages. The recursion ensures that the process stays alive and responsive to further messages.

# Concurrency: Multiple instances of the Greeter process can be spawned simultaneously, and they will operate independently of each other. They can all receive and handle messages concurrently.
