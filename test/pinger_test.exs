defmodule PingerTest do
  use ExUnit.Case
  doctest Pinger

  test "greets the world" do
    assert Pinger.hello() == :world
  end
end
