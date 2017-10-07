defmodule Pinger.PeriodicTask do
  use GenServer

  def init(state) do
    {:ok, state}
  end
end
