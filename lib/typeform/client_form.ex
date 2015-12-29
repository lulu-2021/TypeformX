defmodule Typeform.ClientForm do
  @derive [Poison.Encoder]
  defstruct [:title, :tags, :fields]
end
