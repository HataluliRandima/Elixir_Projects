# Exercise: Building a Supervised Application

Provide a hands-on exercise for students to create a supervised application, such as a simple queue system or a chat server. Provide step-by-step instructions, guiding them through defining child specifications, choosing appropriate restart strategies, and implementing dynamic supervision if needed.

Creating a Project Create a new project using mix new simple_queue --sup. Place the SimpleQueue module code in lib/simple_queue.ex. Add the supervisor code in lib/simple_queue/application.ex. Children can be defined using a list of module names or a list of tuples if you want to include configuration options:

## Example 1:

```
defmodule SimpleQueue.Application do
  use Application

  def start(_type, _args) do
    children = [SimpleQueue]
    opts = [strategy: :one_for_one, name: SimpleQueue.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
```

## Example 2:

```
defmodule SimpleQueue.Application do
  use Application

  def start(_type, _args) do
    children = [{SimpleQueue, [1, 2, 3]}]
    opts = [strategy: :one_for_one, name: SimpleQueue.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
```
Running iex -S mix will automatically start SimpleQueue with [1, 2, 3]. If it crashes, the Supervisor would restart it as if nothing had happened.

DynamicSupervisor For cases where supervised children will not be known at startup, a Dynamic Supervisor is used.

### Example:

options = [name: SimpleQueue.Supervisor, strategy: :one_for_one]
DynamicSupervisor.start_link(options)
{:ok, pid} = DynamicSupervisor.start_child(SimpleQueue.Supervisor, SimpleQueue)
Task Supervisor Tasks have their specialized Supervisor, the Task.Supervisor. It's designed for dynamically created tasks.

### Example:

children = [{Task.Supervisor, name: ExampleApp.TaskSupervisor, restart: :transient}]
{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
{:ok, pid} = Task.Supervisor.start_child(ExampleApp.TaskSupervisor, fn -> background_work end)
Supervision Trees Explore the hierarchical structure of supervisors and workers, and how it enhances fault tolerance.