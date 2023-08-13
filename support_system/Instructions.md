# Test the Ticket System
Start an interactive Elixir shell:

iex -S mix
Create a ticket:

ticket_details = %{id: 1, description: "Login issue", status: :open}
{:ok, pid} = SupportSystem.TicketSupervisor.create_ticket(ticket_details)` 
Assign an agent to the ticket:

GenServer.call(pid, :assign_agent)
Resolve the ticket:

GenServer.call(pid, :resolve)