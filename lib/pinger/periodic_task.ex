defmodule Pinger.PeriodicTask do
  require Logger

  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do
    msg = "just logging now"
    #IO.puts msg
    Logger.info fn ->
      msg
    end

    schedule_work()
    {:noreply, state}
  end


  defp schedule_work() do
    Process.send_after(self(), :work, 2000) # in 2 seconds
  end
end
