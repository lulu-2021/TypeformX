defmodule Typeform.ClientField do
  @moduledoc """
    ** Summary **

    module contains the struct for the Client Form Field from the API - used for creating a form fields
  """
  alias Typeform.FieldValidator

  @doc false
  @derive [Poison.Encoder]
  defstruct [:type, :question, :description, :required]

  @field_types [:short_text, :long_text, :statement, :yes_no,
                :number, :rating, :opinion_scale, :email, :website, :legal]

  @field_types |> Enum.each(fn(ftype) ->
    @doc """
      at compile time we dynamically create a function to check the valid field by `ftype` matching each type

      :short_text      The ShortText Field is the typical, standard text input
      :long_text       You would use a LongTextField if you text longer than one line
      :statement       The statement field is not a question, it's just a opportunity to make conversation in your typeform.
      :yes_no          The YesNo Field is a field that allows the user to answer only yes or no to a question
      :number          The NumberField is like a ShortTextField that only allows numbers.
      :email           You want your users to give you their email
      :website         The WebsiteField is the field you would use if you want to collect a URL from your respondent
      :legal           The LegalField is very similar to the YesNoField, with a smaller body text.


      :rating          RatingField is the best field to use if you want your users to rate in a visual way.
      ==> steps, shape

      :opinion_scale   OpinionScale field is the perfect field if you want to do a NPS style evaluation
      ==> steps, labels, start_at_one

    """
    def valid_field?(unquote(ftype)), do: true
  end)

  @doc """
    and one to catch all other cases..
  """
  def valid_field?(_invalid_field), do: false

  @doc """
    builds a ClientField struct based on a map that has the correct variables
  """
  def build(data) do
    question_type = data["type"]
    question_data = data["question"]
    description_data = data["description"]
    required_option = data["required"] || false
    cond do
      FieldValidator.valid?(question_type, &valid_field?(&1)) ->
        Map.merge(%Typeform.ClientField{},
          %{
            type: question_type,
            question: question_data,
            description: description_data,
            required: required_option
          }
        )
      true ->
        {:error, "Invalid Question Type"}
    end
  end

end
