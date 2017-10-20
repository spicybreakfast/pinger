defmodule Pinger.PeriodicTask do
  require Logger

  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do
    #IO.puts msg
    url = "http://traviserard.com"

    msg =
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        "#{url} is ok :)"
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "#{url} not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        "#{url} error: #{reason}"
    end

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
