defmodule MemberMousey.Calls do


  def send_create(%{"body_params" => body_params}) do
    #get API URL
    apiUrl = "testapi"
    apiCallUrl = "https://"<>apiUrl<> "?q=/createMember";
    #Send Request
    HTTPotion.post apiCallUrl, [
      body: body_params,
      headers: ["User-Agent": "MemberMousey", "Content-Type": "application/x-www-form-urlencoded"]
    ]
  end





end
