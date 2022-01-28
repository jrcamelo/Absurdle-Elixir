defmodule AbsurdleTest do
  use ExUnit.Case
  doctest Absurdle

  test "greets the world" do
    assert Absurdle.hello() == :world
  end
end
