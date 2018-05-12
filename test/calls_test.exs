defmodule CallsTest do
  use ExUnit.Case
  #doctest Calls

  test "my test" do
    assert 1 + 1 == 2
  end
  test "another test " do
    assert 0==0
  end

  test "Get Member" do
    assert MemberMousey.Calls.get_member("Tom", "Jerry") == ""
  end
end
