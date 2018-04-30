defmodule Typeformx.Mixfile do
  use Mix.Project

  def project do
    [app: :typeformx,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     deps: deps(),
     package: package(),
     description: """
     An Elixir client library for the Typeform API (typeform.io)
     """
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end



  # Package information
  defp package do
    [
      files: ["lib", "mix.exs", "README", "LICENSE*"],
      maintainers: ["Steve Forkin"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/netflakes/TypeformX"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, ">= 1.1.1"},
      {:poison, ">= 3.1.0"},
      {:inch_ex, only: [:dev, :test]},
      {:excoveralls, only: [:dev, :test]},
      {:earmark, only: [:dev, :test]},
      {:ex_doc, only: [:dev, :test]},
      {:exvcr, only: [:dev, :test]},
      {:dogma, only: [:dev, :test]},
      {:credo, only: [:dev, :test]}
    ]
  end
end
