defmodule Typeform.Routes do
  @moduledoc """
    ** Summary **
    module to encapsulate the routes wrapped for the TypeForm API
  """

  @base_version "latest"

  @doc """
    route for the `information` on the actual api
  """
  @spec route(:information) :: String.t
  def route(:information) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}"
  end

  @doc """
    retrieve route for creating a typform by passing `:create_form`
  """
  @spec route(:create_form) :: String.t
  def route(:create_form) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}/forms"
  end

  @doc """
    retrieve route for showing a typeform by passing `:show_form` and the `id`
  """
  @spec route(:show_form, form_id: String.t) :: String.t
  def route(:show_form, form_id: form_id) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}/forms/#{form_id}"
  end

end
