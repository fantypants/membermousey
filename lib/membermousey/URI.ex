defmodule MemberMousey.URI do

  def body_field(body_field, value) do
    body_field<>"="<>value
  end

  #{"firstname", "tom"}, {"lastname", "jerry"}


  #def encode_query(list) do
  #  Enum.map(list, fn({k,v}) -> body_field(k, v) end) |> Enum.join("&")
  #end

  def encode_query(list) do
    Enum.map_join list, "&", fn x ->
      IO.inspect x
        pair(x)
      end
  end


  def make_api_header do
    apiSKey = Membermousey.config_or_env_Skey()
    apiKey = Membermousey.config_or_env_key()
    "apikey="<>apiKey<>"&apisecret="<>apiSKey<>"&"
  end

  defp pair({key, value}) do
  cond do
    Enumerable.impl_for(value) ->
      pair(to_string(key), [], value)
    true ->
      param_name = key |> to_string |> URI.encode_www_form
      param_value = value |> to_string |> URI.encode_www_form

      "#{param_name}=#{param_value}"
  end
end


end
