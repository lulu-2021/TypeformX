use Mix.Config

# Typeform configuration

import_config "typeform_secrets_test.exs"

config :dogma,
  rule_set: Typeform.DogmaTestRuleset,

  exclude: [
    ~r(\Alib/vendor/),
  ],

  #override the existing line length
  override: %{ LineLength => [ max_length: 250 ]}
