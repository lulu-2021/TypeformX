defmodule Typeform.ClientForm do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Form data from the API - used for creating a form
  """

  @derive [Poison.Encoder]
  defstruct [:title, :tags, :fields]
end
