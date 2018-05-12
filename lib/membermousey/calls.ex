defmodule MemberMousey.Calls do


  def send_create(%{"body_params" => body_params}) do
    apiEndpoint = "?q=/createMember"
    apiCallUrl = Membermousey.process_url(apiEndpoint)
    #Send Request
    HTTPotion.post apiCallUrl, [
      body: body_params,
      headers: ["User-Agent": "MemberMousey", "Content-Type": "application/x-www-form-urlencoded"]
    ]
  end





end
