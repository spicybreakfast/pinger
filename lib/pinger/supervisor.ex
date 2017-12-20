#defmodule Pinger.Supervisor do
  #use Supervisor

  #def start_link(opts) do
    #Supervisor.start_link(__MODULE__, :ok, opts)
  #end

  #def start_ping do
    #Supervisor.start_child(Pinger.Supervisor, [])
  #end

  #def init(:ok) do
    #Supervisor.init([
      #{Pinger.PeriodicTask, %{url: "http://traviserard.com"}}
    #], strategy: :simple_one_for_one)
  #end
#end
