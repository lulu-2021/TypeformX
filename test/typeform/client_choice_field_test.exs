defmodule Typeform.ClientChoiceField.Test do
  use ExUnit.Case
  alias Typeform.ClientChoiceField

  setup do
    field_types = [:multiple_choice, :picture_choice, :dropdown]

    {:ok, field_types: field_types}
  end

  test "should have a correct list of available field types", %{field_types: field_types} do
    field_types
    |> Enum.each(fn(field_type) ->
      assert ClientChoiceField.valid_field?(field_type)
    end)
  end

  test "should not have an incorrect field type" do
    incorrect_field_type = :short_long_text
    refute ClientChoiceField.valid_field?(incorrect_field_type)
  end

  test "when given an invalid question type - the build function should fail" do
    invalid_field_data = %{"question" => "What is your name?", "type" => "invalid_question_type"}
    build_response = invalid_field_data |> ClientChoiceField.build

    assert build_response == {:error, "Invalid Question Type"}
  end

  test "question with a list of choices" do
    choice1 = %{"label" => "male"}
    choice2 = %{"label" => "female"}
    choice3 = %{"label" => "not-stated"}
    question = %{"question" => "", "type" => "multiple_choice", "choices" => [choice1, choice2, choice3]}
    choice_field = ClientChoiceField.build(question)

    result = choice_field.choices
    |> Enum.map(fn(choice) ->
      %{"label" => choice_value} = choice
      choice_value
    end)
    assert result == ["male","female","not-stated"]
  end

end
