defmodule BlaTest do
  use ExUnit.Case
  doctest Bla

  test "greets the world" do
    assert Bla.hello() == :world
  end
end
