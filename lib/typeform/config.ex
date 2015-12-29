defmodule Typeform.Config do
  @moduledoc """
    ** Summary **
    module to encapsulate the configuration variables used such as the host and api key
  """

  use Mix.Config

  def secret, do: typeform_secret(Mix.env)
  def host, do: typeform_host(Mix.env)

  defp typeform_secret(:test), do: "test_api_key___"
  defp typeform_host(:test), do: "http://test.lvh.me"

  defp typeform_host(_), do: Application.get_env(:typeformx, :typeform_api_host)
  defp typeform_secret(_), do: Application.get_env(:typeformx, :typeform_api_key)
end
