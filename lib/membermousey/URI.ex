defmodule MemberMousey.URI do

  def body_field(body_field, value) do
    body_field<>"="<>value
  end

  #{"firstname", "tom"}, {"lastname", "jerry"}


  #def encode_query(map) do
  #  #Enum.map(map, fn({k,v}) -> body_field(k, v) end) |> Enum.join("&")
  #  map |> Enum.map(fn(x) -> pair(x) end)
  #end

  def encode_query(list) do
    IO.inspect list
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

defp pair(root, parents, values) do
  IO.inspect root
  IO.inspect parents
  IO.inspect values
  Enum.map_join values, "&", fn {key, value} ->
    cond do
      Enumerable.impl_for(value) ->
        pair(root, parents ++ [key], value)
      true ->
        build_key(root, parents ++ [key]) <> URI.encode_www_form(to_string(value))
    end
  end
end

  defp build_key(root, parents) do
      path = Enum.map_join parents, "", fn x ->
        param = x |> to_string |> URI.encode_www_form
        "#{param}"
      end

      "#{path}="
  end


end
