# Exercise Question
Create a new module called WorkerSupervisor, which will be responsible for supervising two workers: WorkerA and WorkerB. Both workers should be GenServers that keep track of a number, and they should support increment and get operations.

## Implement the following functionalities:

- WorkerA and WorkerB: Create the GenServer modules for both workers.
- WorkerSupervisor: Create the supervisor module that uses the <b>:one_for_all strategy.</b>
- Test Functionality: Write a test function that spawns multiple processes to concurrently increment both workers and then prints the final values.