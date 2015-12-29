defmodule Typeform.Config.Test do
  use ExUnit.Case

  test "quick check that we have the test api key" do
    assert Typeform.Config.secret == "test_api_key___"
  end
end
