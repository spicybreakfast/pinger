defmodule Pinger do
  use Application

  def start(_type, _args) do
    Pinger.Supervisor.start_link(name: Pinger.Supervisor)
  end
end
