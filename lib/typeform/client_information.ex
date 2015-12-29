defmodule Typeform.ClientInformation do
  @derive [Poison.Encoder]
  defstruct [:description, :documentation, :name, :support, :time, :version]
end
