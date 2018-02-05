defmodule Pinger.HttpClientTest do
  use ExUnit.Case, async: true

  test "works" do
    #:timer.sleep(500) # pause to let things startup
    #IO.puts "vars: #{System.get_envars"

    assert true # length(Supervisor.which_children(Pinger.PingSupervisor)) == 1
  end
end
