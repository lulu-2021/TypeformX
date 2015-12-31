defmodule Typeform.ClientField.Test do
  use ExUnit.Case
  alias Typeform.ClientField

  setup do
    field_types = [:short_text, :long_text, :multiple_choice, :picture_choice, :statement, :dropdown, :yes_no,
                  :number, :rating, :opinion_scale, :email, :website, :legal]
    {:ok, field_types: field_types}
  end


  test "should have a correct list of available field types", %{field_types: field_types} do
    field_types
    |> Enum.each(fn(field_type) ->
      assert ClientField.valid_field?(field_type)
    end)
  end

  test "should not have an incorrect field type" do
    incorrect_field_type = :short_long_text
    refute ClientField.valid_field?(incorrect_field_type)
  end

  test "when given an invalid question type - the build function should fail" do
    invalid_field_data = %{"question" => "What is your name?", "type" => "invalid_question_type"}
    build_response = invalid_field_data |> ClientField.build

    assert build_response == {:error, "Invalid Question Type"}
  end

end
