defmodule ExamplePassing do

  def messagepass do
    receive do
      {:Hello, "world"} ->
        # code
        IO.puts("Hata")

    end
    # dont forget this for it to continue listenig for additional messages
    messagepass()
  end

end
