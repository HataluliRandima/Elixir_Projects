# OTP Application
- In other words, an application is a kind of package that contains reusable modules, has name, version, specific dependencies, etc.

## Instructions 

## iex -S mix
...
iex(1)> {:ok, pid} = OurNewApp.Counter.start_link(10000)
{:ok, #PID<0.182.0>}
iex(2)> OurNewApp.Counter.get(pid)
10136
iex(3)> OurNewApp.Counter.get(pid)
10146

## iex -S mix
...
iex(1)> [{_, pid, _, _}] = Supervisor.which_children(OurNewApp.Supervisor)
[{OurNewApp.Counter, #PID<0.141.0>, :worker, [OurNewApp.Counter]}]
iex(2)> OurNewApp.Counter.get(pid)
10119
iex(3)> Process.exit(pid, :shutdown)
true
iex(4)> Supervisor.which_children(OurNewApp.Supervisor)
[{OurNewApp.Counter, #PID<0.146.0>, :worker, [OurNewApp.Counter]}]

