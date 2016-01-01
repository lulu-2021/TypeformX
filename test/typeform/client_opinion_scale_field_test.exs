defmodule Typeform.ClientOpinionScaleField.Test do
  use ExUnit.Case
  alias Typeform.ClientOpinionScaleField

  setup do
    valid_field_type = :opinion_scale

    {:ok, valid_field_type: valid_field_type}
  end

  test "should have a correct field type", %{valid_field_type: valid_field_type} do
    assert ClientOpinionScaleField.valid_field?(valid_field_type)
  end

  test "should not have an incorrect field type" do
    incorrect_field_type = :invalid_scale
    refute ClientOpinionScaleField.valid_field?(incorrect_field_type)
  end

  test "when given an invalid question type - the build function should fail" do
    invalid_field_data = %{"question" => "What is your name?", "type" => "invalid_question_type"}
    build_response = invalid_field_data |> ClientOpinionScaleField.build

    assert build_response == {:error, "Invalid Question Type"}
  end

  test "question with an opinion scale" do
    {left, center, right} = {"bad", "ok", "good"}
    labels = %{"left" => left, "center" => center, "right" => right}
    question = %{"question" => "", "type" => "opinion_scale", "labels" => labels, "steps" => 9}
    opinion_scale_field = ClientOpinionScaleField.build(question)

    assert opinion_scale_field.labels["left"] == left
    assert opinion_scale_field.labels["center"] == center
    assert opinion_scale_field.labels["right"] == right
  end


end
