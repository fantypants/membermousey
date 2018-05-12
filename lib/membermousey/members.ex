defmodule MemberMousey.Members do


def new_member(%{"member" => member_params}) do

  f_name = member_params["fname"]
  l_name = member_params["lname"]
  email = member_params["email"]
  phone = member_params["phone"]
  level_id = member_params["level_id"]
  #GET API KEY
end

def get_member(id, email) do
  #http://{Your_API_URL}?q=/getMember
  #Process the options
  # SEnd the call
end








end
