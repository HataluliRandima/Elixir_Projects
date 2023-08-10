defmodule Foo do

  def receiver() do
    receive do
      v -> IO.inspect(v)
      receiver()
    end
  end
end

# call using
# pid = spawn(Foo, :receiver, [])
