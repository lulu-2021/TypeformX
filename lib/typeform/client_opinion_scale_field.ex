defmodule Typeform.ClientOpinionScaleField do
  @moduledoc """
    ** Summary **

    module contains the struct for the Client Form Opinion Scale Field from the API - used for creating a form fields
  """
  alias Typeform.FieldValidator

  @doc false
  @derive [Poison.Encoder]
  defstruct [:type, :question, :labels, :steps, :start_at_one]

  @doc """
    function to check the valid field of :opinion_scale type
  """
  def valid_field?(:opinion_scale), do: true

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
    labels = data["labels"] || %{"left" => "", "center" => "", "right" => ""}
    number_of_steps = data["steps"] || 11
    start_at_one_option = data["vertical_alignment"] || false
    cond do
      FieldValidator.valid?(question_type, &valid_field?(&1)) ->
        Map.merge(%Typeform.ClientOpinionScaleField{},
          %{
            type: question_type,
            question: question_data,
            labels: labels,
            steps: number_of_steps,
            required: start_at_one_option,
          }
        )
      true ->
        {:error, "Invalid Question Type"}
    end
  end

end
