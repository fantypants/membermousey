defmodule MembermouseyTest do
  use ExUnit.Case
  doctest Membermousey

  test "greets the world" do
    assert Membermousey.hello() == :world
  end
end
