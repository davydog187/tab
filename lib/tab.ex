defmodule Tab do
  @moduledoc """
  Tab is a tiny library for converting Elixir terms into
  tabular data.

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
  """

  def tabulate(data, opts \\ [])

  def tabulate(data, opts) when is_list(data) do
    sorter = Keyword.get(opts, :sorter, &Function.identity/1)
    collapsed = Enum.map(data, &collapse_into/1)

    keys =
      Enum.reduce(collapsed, MapSet.new(), fn line, keys ->
        line
        |> Map.keys()
        |> Enum.reduce(keys, &MapSet.put(&2, &1))
      end)

    keys = keys |> Enum.to_list() |> sorter.()

    rows =
      Enum.map(collapsed, fn line ->
        for k <- keys, do: Map.get(line, k)
      end)

    [keys | rows]
  end

  def tabulate(data, opts), do: data |> List.wrap() |> tabulate(opts)

  @doc """
  Collapses a nested map into a map of depth 1

      iex> Tab.collapse_into(%{a: %{b: %{c: 1}}})
      %{"a.b.c" => 1}

      iex> Tab.collapse_into(%{a: %{b: %{c: 3}, c: 2}, b: 1})
      %{"a.b.c" => 3, "a.c" => 2, "b" => 1}
  """
  def collapse_into(data, into \\ %{}, opts \\ []) do
    separator = Keyword.get(opts, :separator, ".")

    collapsed = Tab.Collapsible.collapse(data, [])

    for {prefix, data} <- List.flatten(collapsed), into: into do
      k = prefix |> Enum.reverse() |> Enum.join(separator)
      {k, data}
    end
  end
end
