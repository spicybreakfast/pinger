defmodule Pinger do
  use Application

  def start(_type, _args) do
    children = [
      Pinger.PingSupervisor
      #,Pinger.Starter
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Pinger.Supervisor)
  end
end
