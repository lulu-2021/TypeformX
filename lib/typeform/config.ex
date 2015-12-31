defmodule Typeform.Config do
  @moduledoc """
    ** Summary **
    module to encapsulate the configuration variables used such as the host and api key
  """

  use Mix.Config

  @doc """
    based on the Mix.env param - retrieve the typeform api_key/secret

    iex> Typeform.Config.secret "Test"
    "test_api_key___"

  """
  def secret, do: typeform_secret(Mix.env)

  @doc """
    based on the Mix.env param - retrieve the typeform host

    iex> Typeform.Config.host "Test"
    "http://test.lvh.me"

  """
  def host, do: typeform_host(Mix.env)

  defp typeform_secret(:test), do: "test_api_key___"
  defp typeform_secret(_), do: Application.get_env(:typeformx, :typeform_api_key)

  defp typeform_host(:test), do: "http://test.lvh.me"
  defp typeform_host(_), do: Application.get_env(:typeformx, :typeform_api_host)
end
