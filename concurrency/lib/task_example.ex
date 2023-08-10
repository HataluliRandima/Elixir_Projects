defmodule TaskExample do

  def double(x) do
    :timer.sleep(2000)
    x * 2
  end
end

# For the testing part
# task = Task.async(Example, :double, [2000])


# # Do some work

# Task.await(task)
# 4000
