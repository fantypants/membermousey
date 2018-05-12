defmodule Membermousey do

  defmodule MissingSecretKeyError do
    defexception message: """
      The membermouse_secret_key setting is required so that we can report the
      correct environment instance to Membermouse. Please configure
      secret_key in your config.exs and environment specific config files
      to have accurate reporting of errors.
      config :membermousey, membermouse_secret_key: YOUR_SECRET_KEY
    """
end

defmodule MissingClientKeyError do
  defexception message: """
    The membermouse_client_key setting is required so that we can report the
    correct environment instance to Membermouse. Please configure
    membermouse_client_key in your config.exs and environment specific config files
    to have accurate reporting of errors.
    config :membermousey, membermouse_client_key: YOUR_CLIENT_KEY
  """
end

defmodule MissingClientUrlError do
  defexception message: """
    The membermouse_client_url setting is required so that we can push correct requests to Membermouse. Please configure
    membermouse_client_url in your config.exs and environment specific config files
    to have accurate reporting of errors.
    config :membermousey, membermouse_client_url: YOUR_CLIENT_URL
  """
end

  def config_or_env_url do
    require_membermouse_client_url()
  end

  def config_or_env_key do
    require_membermouse_Skey()
  end

  def config_or_env_Skey do
    require_membermouse_Skey()
  end


  def make_authorized_enquiry(method, body, key, endpoint) do
    rb = MemberMousey.URI.encode_query(body)
    rh = req_headers(key)
  
  end

  def req_headers(key) do
    Map.new
      |> Map.put("User-Agent",    "MemberMouse/v1 MemberMousey/0.0.1")
      |> Map.put("Content-Type",  "application/x-www-form-urlencoded")
  end

  defp require_membermouse_client_url do
    case Application.get_env(:membermousey, :membermouse_client_url, System.get_env "MEMBERMOUSE_CLIENT_URL") || :not_found do
      :not_found ->
        raise MissingClientUrlError
      value -> value
    end
  end

  defp require_membermouse_Skey do
   case Application.get_env(:membermousey, :membermouse_secret_key, System.get_env "MEMBERMOUSE_CLIENT_SECRET_KEY") || :not_found do
     :not_found ->
       raise MissingSecretKeyError
     value -> value
   end
 end

 defp require_membermouse_clientkey do
  case Application.get_env(:membermousey, :membermouse_client_key, System.get_env "MEMBERMOUSE_CLIENT_KEY") || :not_found do
    :not_found ->
      raise MissingClientKeyError
    value -> value
  end
end

  def process_url(endpoint) do
     api_base_url = Application.get_env(:membermousey, :membermouse_client_url, System.get_env "MEMBERMOUSE_CLIENT_URL")
     "https://"<>api_base_url <> endpoint
  end

  defp httpoison_request_options() do
      Application.get_env(:membermousey, :httpoison_options, [])
  end


end
