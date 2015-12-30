use Mix.Config

# Typeform configuration
import_config "typeform_secrets.exs"

config :dogma,
  rule_set: Typeform.DogDogmaTestRuleset,

  exclude: [
    ~r(\Alib/vendor/),
  ],

  #override the existing line length
  override: %{ LineLength => [ max_length: 250 ]}
