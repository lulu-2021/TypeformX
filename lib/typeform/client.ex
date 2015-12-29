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

  defp response_body(response) do
    {:ok, response_data} = response
    response_data.body
  end

  defp get_request(path), do: get(path, http_options)

  defp http_options do
    %{"X-API-TOKEN" => Typeform.Config.secret}
  end
end
