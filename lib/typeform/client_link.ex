defmodule Typeform.ClientLink do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Link data from the API
  """

  @doc false
  @derive [Poison.Encoder]
  defstruct [:rel, :href]

  @doc """
    builds a ClientLink struct based on a `data` map that has the correct variables
  """
  def build(data) do
    Map.merge(%Typeform.ClientLink{}, %{rel: data["rel"], href: data["href"]})
  end

end
