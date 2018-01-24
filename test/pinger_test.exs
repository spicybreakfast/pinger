defmodule Pinger.PingerTest do
  use ExUnit.Case, async: true

  test "the application auto-starts supervised children" do
    :timer.sleep(500) # pause to let things startup

    assert length(Supervisor.which_children(Pinger.PingSupervisor)) == 1
  end
end
