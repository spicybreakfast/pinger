defmodule Pinger.PingStarter do
  use Task

  def start_link(_opts) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run do
    urls = Pinger.Ping |> Pinger.Repo.all

    Enum.each(urls, fn url ->
      Pinger.PingSupervisor.start_ping(%{url: url.url})
    end)
  end
end
