defmodule Typeform.ClientInformation do
  @moduledoc """

    ** Summary **

    module contains the struct for the Client Information data from the API
  """

  @doc false
  @derive [Poison.Encoder]
  defstruct [:description, :documentation, :name, :support, :time, :version]
end
