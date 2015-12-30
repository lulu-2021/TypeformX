defmodule Typeform.DogmaTestRuleset do
  @moduledoc """
  Ruleset for dogma to ignore windows lineendings that appear in the CI build in Semaphore CI
  """
   @behaviour Dogma.RuleSet

   def rules do
     Dogma.RuleSet.All.rules |> Dict.drop([WindowsLineEndings, FinalNewline])
   end
end
