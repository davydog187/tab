defmodule Tab.MixProject do
  use Mix.Project

  @repo_url "https://github.com/bitfo/tab"

  def project do
    [
      app: :tab,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Tab",
      source_url: @repo_url,
      homepage_url: @repo_url,
      description: "A tiny library for converting Elixir terms into tabular data",
      package: package(),
      docs: [
        # The main page in the docs
        main: "Tab"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @repo_url
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
