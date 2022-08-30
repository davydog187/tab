defmodule TabTest do
  use ExUnit.Case
  doctest Tab

  test "collapse maps with struct keys" do
    owen = ~D[2021-03-01]
    assert Tab.collapse_into(%{a: 1, date: owen}) == %{"a" => 1, "date" => "2021-03-01"}
  end
end
