defmodule Typeform.Routes.Test do
  use ExUnit.Case
  alias Typeform.Routes

  @base_version "latest"

  test "information route" do
    base_url = Typeform.Config.host
    information_route = Routes.route(:information)
    assert information_route == "#{base_url}/#{@base_version}"
  end

  test "show form route" do
    base_url = Typeform.Config.host
    show_form_id = 1
    show_form_route = Routes.route(:show_form, form_id: show_form_id)
    assert show_form_route == "#{base_url}/#{@base_version}/forms/#{show_form_id}"
  end
end
