defmodule Typeform.Routes do
  @moduledoc """
    ** Summary **
    module to encapsulate the routes wrapped for the TypeForm API
  """

  @base_version "latest"

  def route(:information) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}"
  end

  def route(:create_form) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}/forms"
  end

  def route(:show_form, form_id: form_id) do
    base_url = Typeform.Config.host
    "#{base_url}/#{@base_version}/forms/#{form_id}"
  end

end
