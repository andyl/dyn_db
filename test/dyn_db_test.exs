defmodule DynDbTest do
  use ExUnit.Case
  doctest DynDb

  test "greets the world" do
    assert DynDb.hello() == :world
  end
end
