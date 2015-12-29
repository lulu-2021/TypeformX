defmodule Typeform.ClientLink do
  @derive [Poison.Encoder]
  defstruct [:rel, :href]

  def build(data) do
    Map.merge(%Typeform.ClientLink{}, %{rel: data["rel"], href: data["href"]})
  end
end
