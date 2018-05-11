defmodule MembermouseyTest do
  use ExUnit.Case
  doctest Membermousey

  test "Ensure Client Key" do
    assert Membermousey.config_or_env_key()   == "test"
  end

  test "Ensure Secret Key" do
    assert Membermousey.config_or_env_Skey()   == "test"
  end

  test "Ensure Client Url" do
    assert Membermousey.config_or_env_url()   == "test"
  end

  test "process_url" do
    assert Membermousey.process_url("/create") == "https://test/create"
  end
end
