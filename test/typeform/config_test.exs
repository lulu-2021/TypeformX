defmodule Typeform.Config.Test do
  use ExUnit.Case

  setup do
    Mix.env(:test)
    {:ok, test_env: Mix.env}
  end

  test "check that we have the test api key" do
    assert Typeform.Config.secret == "test_api_key___"
  end

  test "check that we have the test api host" do
    assert Typeform.Config.host == "http://test.lvh.me"
  end

  test "check that we have the dev api key" do
    Mix.env(:bla)
    refute Typeform.Config.secret == "test_api_key___"
    Mix.env(:test)
  end

  test "check that we have the dev host" do
    Mix.env(:bla)
    refute Typeform.Config.host == "http://test.lvh.me"
    Mix.env(:test)
  end

end
