defmodule Typeform.ClientChoiceField do
  @moduledoc """
    ** Summary **

    module contains the struct for the Client Form Choice Field from the API - used for creating a form fields
  """
  alias Typeform.FieldValidator

  @doc false
  @derive [Poison.Encoder]
  defstruct [:type, :question, :description, :required, :choices]

  @field_types [:multiple_choice, :picture_choice, :dropdown]

  @field_types |> Enum.each(fn(ftype) ->
    @doc """
      at compile time we dynamically create a function to check the valid field by `ftype` matching each type

      :multiple_choice The MultipleChoiceField is used for, displaying multiple choice text answers.
      :picture_choice  The PictureChoiceField is much like the MultipleChoiceField but you can also use images as choices
      :dropdown        The DropdownField is a cross between select element auto-completion.

      ==> choices (all three)
    """
    def valid_field?(unquote(ftype)), do: true
  end)

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
    required_option = data["required"] || false
    choices_list = data["choices"] || []
    cond do
      FieldValidator.valid?(question_type, &valid_field?(&1)) ->
        Map.merge(%Typeform.ClientChoiceField{},
          %{
            type: question_type,
            question: question_data,
            description: description_data,
            required_option: required_option,
            choices: choices_list
          }
        )
      true ->
        {:error, "Invalid Question Type"}
    end
  end

end
