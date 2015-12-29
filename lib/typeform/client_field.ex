defmodule Typeform.ClientField do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Form Field from the API - used for creating a form fields
  """

  @derive [Poison.Encoder]
  defstruct [:type, :question]

  def build(data) do
    Map.merge(%Typeform.ClientField{}, %{type: data["type"], question: data["question"]})
  end
end
