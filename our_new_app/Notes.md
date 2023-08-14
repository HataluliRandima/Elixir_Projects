# OTP Application
- In other words, an application is a kind of package that contains reusable modules, has name, version, specific dependencies, etc.

## Instructions 

iex -S mix
...
iex(1)> {:ok, pid} = OurNewApp.Counter.start_link(10000)
{:ok, #PID<0.182.0>}
iex(2)> OurNewApp.Counter.get(pid)
10136
iex(3)> OurNewApp.Counter.get(pid)
10146
