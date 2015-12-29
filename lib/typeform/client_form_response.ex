defmodule Typeform.ClientFormResponse do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Form data from the API - data contained in the API response
  """

  @derive [Poison.Encoder]
  defstruct [:id, :title, :tags, :fields, :urls, :_links]
end
