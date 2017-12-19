defmodule Pinger.PeriodicTaskTest do
  use ExUnit.Case, async: true

  #setup do
    #{:ok, periodic_task} = start_supervised({Pinger.PeriodicTask, %{url: "http://example.com"}})

    #%{periodic_task: periodic_task}
  #end

  #test "works" do
    #assert_receive(:work)

    #Pinger.PeriodicTask.init(:work, %{url: "http://example.com"})
  #end
end
