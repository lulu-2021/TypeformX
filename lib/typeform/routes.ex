defmodule Typeform.Routes do

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
