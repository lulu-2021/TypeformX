defmodule Typeform.ClientFormResponse do
  @derive [Poison.Encoder]
  defstruct [:id, :title, :tags, :fields, :urls, :_links]
end
