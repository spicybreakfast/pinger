defmodule Pinger.PeriodicTask do
  require Logger

  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(state) do
    start_msg = "starting ping for #{state.url}"
    IO.puts start_msg
    Logger.info fn ->
      start_msg
    end

    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do
    ping(state.url)

    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 6000) # in 1 minute
  end

  defp ping(url) do
    msg = case HTTPoison.get(url) do
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

    IO.puts msg
    Logger.info fn ->
      msg
    end
  end

end
