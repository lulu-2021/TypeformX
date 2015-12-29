defmodule Typeform.ClientField do
  @derive [Poison.Encoder]
  defstruct [:type, :question]

  def build(data) do
    Map.merge(%Typeform.ClientField{}, %{type: data["type"], question: data["question"]})
  end
end
