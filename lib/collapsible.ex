defprotocol Tab.Collapsible do
  @moduledoc """
  A protocol that collapses nested structures into flat ones
  """
  @fallback_to_any true
  def collapse(item, prefix)
end

defimpl Tab.Collapsible, for: [Integer, Float, BitString] do
  def collapse(val, prefix) do
    [{prefix, val}]
  end
end

defimpl Tab.Collapsible, for: Any do
  def collapse(val, prefix) do
    [{prefix, to_string(val)}]
  end
end

defimpl Tab.Collapsible, for: Map do
  def collapse(map, prefix) do
    Enum.map(map, fn {k, v} ->
      Tab.Collapsible.collapse(v, [k | prefix])
    end)
  end
end
