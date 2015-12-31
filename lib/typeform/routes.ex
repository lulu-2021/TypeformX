defmodule Typeform.Routes do
  @moduledoc """
    ** Summary **
    module to encapsulate the routes wrapped for the TypeForm API
  """

  @base_version "latest"

  @doc ~S"""
    based on the `:information` param, retrieve the route for info on the actual api

      iex> Typeform.Routes.route :information
      "https://api.typeform.io/latest"

  """
  def route(:information) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}"
  end

  @doc ~S"""
    based on the `:create_form` param, retrieve the route for creating a typform

      iex> Typeform.Routes.route :create_form
      "https://api.typeform.io/latest/forms"

  """
  def route(:create_form) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}/forms"
  end

  @doc """
    based on the `:show_form` and the form `id` params retrieve the route for showing a typeform

      iex> Typeform.Routes.route :show_form, form_id: "abced3h4y"
      "https://api.typeform.io/latest/forms/abced3h4y"

  """
  def route(:show_form, form_id: form_id) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}/forms/#{form_id}"
  end

end
