defmodule Pinger.PeriodicTask do
  require Logger

  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(state) do
    start_msg = "starting ping for #{state.url}"
    IO.puts start_msg
    log start_msg

    ping_with_logging(state)
    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do

    schedule_work()
    ping_with_logging(state)


    {:noreply, state}
  end

  defp schedule_work() do
    minutes = 5
    Process.send_after(self(), :work, minutes * 60 * 1000)
  end

  defp ping(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        "#{url} is ok :)"
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "#{url} not found :("
      {:ok, %HTTPoison.Response{status_code: 301}} ->
        "#{url} is a redirect."
      {:error, %HTTPoison.Error{reason: reason}} ->
        "#{url} error: #{reason}"
      {:ok, %HTTPoison.Response{status_code: code}} ->
        "#{url} unhandled code: #{code}"
    end
  end

  defp ping_with_logging(state) do
    start_ping = Task.async(fn -> ping(state.url) end)
    log Task.await start_ping
  end

  defp log(msg) do
    Logger.info fn ->
      msg
    end
  end
end
