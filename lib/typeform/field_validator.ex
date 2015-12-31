defmodule Typeform.FieldValidator do
  @moduledoc """
    ** Summary **

    module contains common functions for field validation - for now just a valid? function
    that receives the validate function as a param and first changes the question type to an atom
  """

  def valid?(data, validate_fn) do
    question_type = String.to_atom(data)
    question_type
    |> validate_fn.()
  end

end
