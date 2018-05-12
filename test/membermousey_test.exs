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
    assert Membermousey.config_or_env_url()   == "www.drewbairdfitness.com/wp-content/plugins/membermouse/api/request.php"
  end

  test "process_url" do
    assert Membermousey.process_url("/create") == "https://www.drewbairdfitness.com/wp-content/plugins/membermouse/api/request.php/create"
  end


  test "Make Auth Enquiry" do
    member_data = %{member: %{
          firstname: "Tom",
          lastname: "Jerry"
        }}

    assert Membermousey.make_authorized_enquiry(:post, member_data, "default", "?/member") == "firstname=Tom&lastname=Jerry"
  end


end
