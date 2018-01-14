require IEx;

defmodule Pinger.PeriodicTaskTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO
  import ExUnit.CaptureLog
  require Logger

  setup do
    #{:ok, periodic_task} = start_supervised({Pinger.PeriodicTask, %{url: "http://example.com"}})
    #%{periodic_task: periodic_task}

    {:ok, starter} = start_supervised({Pinger.PingStarter, restart: :transient})

    IEx.pry
    %{starter: starter}
  end

  test "" do
    assert {:noreply, %{url: "http://example.com"}} == Pinger.PeriodicTask.handle_info(:work, %{url: "http://example.com"})
  end

  test "prints start message" do
    assert capture_io(fn ->
      Pinger.PeriodicTask.init(%{url: "http://example.com"})
    end) =~ "starting ping for"
  end

  test "logs stuff" do
    assert capture_log(fn ->
      Pinger.PeriodicTask.handle_info(:work, %{url: "http://example.com"})
    end) =~ "http://example.com is ok"
  end
end
