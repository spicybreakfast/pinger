defmodule Pinger.PingStarter do
  use Task

  def start_link(_opts) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run do
    urls = ["http://traviserard.com", "http://trav.co", "http://orbular.com", "http://automatemysmall.biz"]

    Enum.each(urls, fn url ->
      Pinger.PingSupervisor.start_ping(%{url: url})
    end)
  end
end
