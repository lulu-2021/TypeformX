defmodule Typeform.ClientRatingField do
  @moduledoc """
    ** Summary **

    module contains the struct for the Client Form Rating Field from the API - used for creating a form fields
  """
  alias Typeform.FieldValidator

  @doc false
  @derive [Poison.Encoder]
  defstruct [:type, :question, :steps, :shape]

  @doc """
    function to check the valid field of :rating type
  """
  def valid_field?(:rating), do: true

  @doc """
    and one to catch all other cases..
  """
  def valid_field?(_invalid_field), do: false

  @doc """
    builds a ClientChoiceField struct based on a map that has the correct variables
  """
  def build(data) do
    question_type = data["type"]
    question_data = data["question"]
    description_data = data["description"]
    shape = data["shape"] || "stars"
    number_of_steps = data["steps"] || 5
    cond do
      FieldValidator.valid?(question_type, &valid_field?(&1)) ->
        Map.merge(%Typeform.ClientRatingField{},
          %{
            type: question_type,
            question: question_data,
            description: description_data,
            shape: shape,
            steps: number_of_steps
          }
        )
      true ->
        {:error, "Invalid Question Type"}
    end
  end

end
