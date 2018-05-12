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

  def get_member(firstname, lastname) do
    body = %{member: %{firstname: firstname, lastname: lastname}}
    Membermousey.make_authorized_enquiry(:post, body, "default", "?q=/getMember") |> IO.inspect
  end





end
