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

## iex -S mix
...
iex(1)> Supervisor.which_children(OurNewApp.Supervisor)
[{OurNewApp.CounterSup, #PID<0.161.0>, :supervisor, [OurNewApp.CounterSup]}]
iex(2)> Supervisor.which_children(OurNewApp.CounterSup)
[
  {20000, #PID<0.163.0>, :worker, [OurNewApp.Counter]},
  {10000, #PID<0.162.0>, :worker, [OurNewApp.Counter]}
]

## Many developers consider custom supervisors tricky and avoid using them. So let's do some simple exercises to get more acquainted with them.

### First, we'll add a third counter to our counter supervisor at runtime:
iex(3)> new_child_spec = Supervisor.child_spec({OurNewApp.Counter, 30000}, id: 30000)
%{id: 30000, start: {OurNewApp.Counter, :start_link, [30000]}}
iex(4)> Supervisor.start_child(OurNewApp.CounterSup, new_child_spec)
{:ok, #PID<0.169.0>}
iex(5)> Supervisor.which_children(OurNewApp.CounterSup)
[
  {30000, #PID<0.169.0>, :worker, [OurNewApp.Counter]},
  {20000, #PID<0.163.0>, :worker, [OurNewApp.Counter]},
  {10000, #PID<0.162.0>, :worker, [OurNewApp.Counter]}
]
