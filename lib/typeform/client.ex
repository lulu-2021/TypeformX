defmodule Typeform.Client do
  @moduledoc """
    ** Summary **
    module to encapsulate the functions wrapped for the TypeForm API - creating and retrieving form data
  """

  use HTTPoison.Base
  alias Typeform.Routes

  @doc """
    retrieves basic api information that helps to confirm that authentication has occurred correctly

    iex> Typeform.Client.information
  """
  def information do
    route = Routes.route(:information)
    route
    |> get_request
    |> response_body
    |> Poison.decode!(as: Typeform.ClientInformation)
  end

  @doc """
    creates a typeform form from a json payload - expects the input to be a json formatted string
  """
  def create_form(payload) do
    route = Routes.route(:create_form)
    route
    |> post_request(payload)
    |> response_body
    |> Poison.decode!(as: Typeform.ClientFormResponse)
  end

  @doc """
    retrieves a typeform form by it's id
  """
  def show_form(id) do
    route = Routes.route(:show_form, form_id: id)
    route
    |> get_request()
    |> response_body
    |> Poison.decode!(as: Typeform.ClientFormResponse)
  end

  @doc """
    retrieves the external url to the form by it's id
  """
  def form_render_url(id) do
    form_data = form_url(id)
    form_data
    |> Enum.filter_map(fn(url) ->
      %{"href" => url["href"], "rel" => "form_render"} == url
    end, &(Map.get(&1, "href")))
    |> List.first
  end

  defp form_url(id) do
    form_data = show_form(id)
    form_data
    |> process_form_response
  end

  defp process_form_response(form_data) do
    %Typeform.ClientFormResponse{id: _, title: _, tags: _, fields: _, urls: _, _links: links} = form_data
    links
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
