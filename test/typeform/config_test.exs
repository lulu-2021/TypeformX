defmodule Typeform.Config.Test do
  use ExUnit.Case

  test "check that we have the test api key" do
    assert Typeform.Config.secret == "test_api_key___"
  end

  test "check that we have the test api host" do
    assert Typeform.Config.host == "http://test.lvh.me"
  end
end
