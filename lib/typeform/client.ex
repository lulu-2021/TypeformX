defmodule Typeform.Client do

  use HTTPoison.Base
  alias Typeform.Routes

  def information do
    route = Routes.route(:information)
    route
    |> get_request
    |> response_body
    |> Poison.decode!(as: Typeform.ClientInformation)
  end

  def create_form(payload) do
    route = Routes.route(:create_form)
    route
    |> post_request(payload)
    |> response_body
    |> Poison.decode!(as: Typeform.ClientFormResponse)
  end

  defp response_body(response) do
    {:ok, response_data} = response
    response_data.body
  end

  defp get_request(path), do: get(path, http_options)

  defp post_request(path, payload), do: post(path, payload, http_options)

  defp http_options do
    %{"X-API-TOKEN" => Typeform.Config.secret}
  end
end
