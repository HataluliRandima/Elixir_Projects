defmodule SimpleProcess do

  def print_message do
    IO.puts("Hello hata, from a spawned process!")
  end

  def calculate_value(a, b) do
    IO.puts("The answer is #{a + b}")
  end

end

# On the iex
# pid = spawn(SimpleProcess, :print_message, [])

# for other function
# pid = spawn(SimpleProcess, :calculate_value, [3,5])
