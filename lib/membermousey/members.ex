defmodule MemberMousey.Members do


def new_member(%{"member" => member_params}) do
  apiKey = "apikey={Your_API_Key}&apisecret={Your_API_Secret}&"
  f_name = member_params["fname"]
  l_name = member_params["lname"]
  email = member_params["email"]
  phone = member_params["phone"]
  level_id = member_params["level_id"]
  #GET API KEY
end








end
