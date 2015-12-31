defmodule Typeform.FieldValidator do

  def valid?(data, validate_fn) do
    question_type = String.to_atom(data)
    question_type
    |> validate_fn.()
  end

end
