defmodule Typeform.ClientForm do
  @derive [Poison.Encoder]
  defstruct [:id, :title, :fields, :_links]
end
