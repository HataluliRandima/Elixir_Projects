defmodule AgentBasics do
  # Step 1
  {:ok, agent} = Agent.start_link(fn -> [1, 2, 3] end)

 # Step 2
  Agent.update(agent, fn (state) -> state ++ [4, 5] end)


 # Step 3
 Agent.get(agent, &(&1))


 ## Naming your agent or giving it name instead of PID :
 Agent.start_link(fn -> [1, 2, 3] end, name: Numbers)


Agent.get(Numbers, &(&1))
[1, 2, 3]

end
