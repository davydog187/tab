# Tab

[![Build Status](https://github.com/bitfo/tab/workflows/CI/badge.svg?branch=main)](https://github.com/bitfo/tab/actions) [![Hex pm](https://img.shields.io/hexpm/v/tab.svg?style=flat)](https://hex.pm/packages/tab) [![Hexdocs.pm](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/tab/)

<!-- MDOC !-->

Tab is a tiny library for converting Elixir terms into tabular data.

      iex> Tab.tabulate([%{a: 1, b: 2, c: 3}, %{a: 1, b: 2}])
      [
        ["a", "b", "c"],
        [1, 2, 3],
        [1, 2, nil]
      ]

Tab also works with nested data

      iex> Tab.tabulate([%{a: %{b: 1, c: 2}}])
      [
        ["a.b", "a.c"] ,
        [1, 2]
      ]

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tab` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tab, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/tab>.
