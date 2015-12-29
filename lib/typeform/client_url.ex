defmodule Typeform.ClientUrl do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Url data from the API
  """

  @derive [Poison.Encoder]
  defstruct [:id, :form_id, :version]

  def build(data) do
    Map.merge(%Typeform.ClientUrl{}, %{id: data["id"], form_id: data["form_id"], version: data["version"]})
  end
end
