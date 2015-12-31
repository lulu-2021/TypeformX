defmodule Typeform.ClientField do
  @moduledoc """
    ** Summary **
    module contains the struct for the Client Form Field from the API - used for creating a form fields
  """
  @derive [Poison.Encoder]
  defstruct [:type, :question]

  @field_types [:short_text, :long_text, :multiple_choice, :picture_choice, :statement, :dropdown, :yes_no,
                :number, :rating, :opinion_scale, :email, :website, :legal]

  # at compile time we dynamically create a function matching each type
  @field_types |> Enum.each(fn(ftype) ->
    def valid_field?(unquote(ftype)), do: true
  end)
  # and one to catch all other cases..
  def valid_field?(_invalid_field), do: false

  def build(data) do
    question_type = data["type"]
    question_data = data["question"]
    cond do
      valid?(question_type) ->
        Map.merge(%Typeform.ClientField{}, %{type: question_type, question: question_data})
      true ->
        {:error, "Invalid Question Type"}
    end
  end

  defp valid?(data) do
    question_type = String.to_atom(data)
    question_type
    |> valid_field?
  end

end
