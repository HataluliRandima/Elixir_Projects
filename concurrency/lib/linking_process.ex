defmodule LinkingProcess do

  # DO some exercise

  def start_link do
    spawn_link(fn -> loop() end)
  end

  def loop do
    receive do
       :exit -> exit(:normal)
       msg -> IO.puts("REceived: #{msg}")
       loop()
    end

  end

  # Do that function of sending message to the loop




  def exploded do
    exit(:Boomed)
  end

  # Now the function for testing Process flag

  def explode do
    exit(:Itschai)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(LinkingProcess, :explode, [])


    receive do
      {:EXIT,_from_pid ,reason} -> IO.puts("Exit reason: #{reason}")
        # code
    end

  end
end

# calling our function
# pid = LinkingProcess.start_link()


#
# spawn(Example, :explode, [])


# spawn_link(Example, :explode, [])
# It will give you an output
# ** (EXIT from #PID<0.144.0>) shell process exited with reason: :Boomed


#Testing the last one fror trap exit
#LinkingProcess.run
