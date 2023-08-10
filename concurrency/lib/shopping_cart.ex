defmodule ShoppingCart do

    #added our macro use
    use GenServer

    # Client Api

    # They run two diff processes

    #creating 1 funct used to start our shopping process
    # it start our server
    def start_link() do
      GenServer.start_link(__MODULE__, [])
    end

    def add_to_cart(pid, item) do
      GenServer.cast(pid, item)
    end

    # we care about response
    # we use synchronous operation
    def get_cart(pid) do
      GenServer.call(pid, :view)
    end

    #remove the item
    def remove_from_cart(pid, item) do
      #we dont care about reponse
      GenServer.cast(pid,{:remove, item})
    end



   # Server

   ## call backs
   def handle_cast({:remove, item}, list) do
    updated_list = Enum.reject(list, fn(i) -> i == item end)
    {:noreply, updated_list}
  end


   def handle_cast(item, list) do
    update_cart = [item|list]
    {:noreply, update_cart }
  end

  def handle_call(:view, _from, list) do
    updated_list = list
    |> Enum.frequencies()
    |> Map.to_list()
    {:reply, updated_list, list}
  end



    def init(list) do
      {:ok, list}
    end


end
