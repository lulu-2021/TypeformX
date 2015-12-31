defmodule Typeform.ClientUrl do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Url data from the API
  """

  @doc false
  @derive [Poison.Encoder]
  defstruct [:id, :form_id, :version]

  @doc """
    builds a ClientUrl struct based on a `data` map that has the correct variables
  """
  def build(data) do
    Map.merge(%Typeform.ClientUrl{}, %{id: data["id"], form_id: data["form_id"], version: data["version"]})
  end
end
