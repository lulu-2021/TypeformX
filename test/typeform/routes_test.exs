defmodule Typeform.Routes.Test do
  use ExUnit.Case
  alias Typeform.Routes

  @base_version "latest"

  setup do
    base_url = Typeform.Config.host
    {:ok, base_url: base_url}
  end

  test "information route", %{base_url: base_url} do
    information_route = Routes.route(:information)
    assert information_route == "#{base_url}/#{@base_version}"
  end

  test "show form route", %{base_url: base_url} do
    show_form_id = 1
    show_form_route = Routes.route(:show_form, form_id: show_form_id)
    assert show_form_route == "#{base_url}/#{@base_version}/forms/#{show_form_id}"
  end
end
