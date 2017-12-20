defmodule Pinger.PingSupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def start_ping(ping) do
    Supervisor.start_child(__MODULE__, [ping])
  end

  def init(_) do
    ping_spec = Supervisor.child_spec(Pinger.PeriodicTask, start: {Pinger.PeriodicTask, :start_link, []})

    Supervisor.init([ping_spec], strategy: :simple_one_for_one)
  end
end
