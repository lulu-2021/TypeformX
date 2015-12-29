defmodule Typeform.ClientUrl do
  @derive [Poison.Encoder]
  defstruct [:id, :form_id, :version]

  def build(data) do
    Map.merge(%Typeform.ClientUrl{}, %{id: data["id"], form_id: data["form_id"], version: data["version"]})
  end
end
