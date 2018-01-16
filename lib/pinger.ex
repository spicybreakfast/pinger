defmodule Pinger do
  use Application

  def start(_type, _args) do
    children = [
      Pinger.Repo,
      Pinger.PingSupervisor,
      {Pinger.PingStarter, restart: :transient}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Pinger.Supervisor)
  end
end
