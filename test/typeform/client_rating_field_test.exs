defmodule Typeform.ClientRatingField.Test do
  use ExUnit.Case
  alias Typeform.ClientRatingField

  setup do
    valid_field_type = :rating

    {:ok, valid_field_type: valid_field_type}
  end

  test "should not have an incorrect field type" do
    incorrect_field_type = :invalid_rating
    refute ClientRatingField.valid_field?(incorrect_field_type)
  end

  test "question with a rating" do
    question = %{"question" => "", "type" => "rating", "steps" => 5, "shape" => "stars"}
    rating_field = ClientRatingField.build(question)

    assert rating_field.steps == 5
    assert rating_field.shape == "stars"
  end

end
