defmodule Pinger.PeriodicTaskTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO
  import ExUnit.CaptureLog
  require Logger

  #setup do
    #{:ok, starter} = start_supervised({Pinger.PingStarter, restart: :transient})

    #%{starter: starter}
  #end

  test "" do
    assert {:noreply, %{url: "http://example.com"}} == Pinger.PeriodicTask.handle_info(:work, %{url: "http://example.com"})
  end

  test "prints start message" do
    assert capture_io(fn ->
      Pinger.PeriodicTask.init(%{url: "http://example.com"})
    end) =~ "starting ping for"
  end

  test "logs message from periodic task" do
    assert capture_log(fn ->
      Pinger.PeriodicTask.handle_info(:work, %{url: "http://example.com"})
    end) =~ "http://example.com is ok"
  end

  test "logs Mix.env as part of message" do
    assert capture_log(fn ->
      Pinger.PeriodicTask.handle_info(:work, %{url: "http://example.com"})
    end) =~ "[TEST]"
  end
end
