defmodule Typeform.ClientLink do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Link data from the API
  """

  @derive [Poison.Encoder]
  defstruct [:rel, :href]

  def build(data) do
    Map.merge(%Typeform.ClientLink{}, %{rel: data["rel"], href: data["href"]})
  end

end
