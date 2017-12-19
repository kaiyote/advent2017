defmodule Advent2017.Day2 do
  @moduledoc ~S"""
  Day 2

  ## Examples

      iex> part1 Advent2017.Input.day2
      36766

      iex> part2 Advent2017.Input.day2
      261
  """

  def part1(input) do
    input
    |> prepare_input()
    |> Enum.map(fn [x | xs] -> List.last(xs) - x end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> prepare_input()
    |> Enum.map(&(&1
                  |> Enum.reverse()
                  |> gen_all_pairs()
                  |> Enum.filter(fn {x, y} -> rem(x, y) == 0 end)
                  |> Enum.at(0)
                  |> (fn {x, y} -> div(x, y) end).()
                  )
                )
    |> Enum.sum()
  end

  defp prepare_input(input) do
    input
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(&Enum.map(&1, fn x -> String.to_integer x end))
    |> Enum.map(&Enum.sort/1)
  end

  defp gen_all_pairs(list, pairs \\ [])
  defp gen_all_pairs([x, y], pairs), do: [{x, y} | pairs]
  defp gen_all_pairs([x | xs], pairs) do
    new_pairs = for y <- xs, do: {x, y}
    gen_all_pairs xs, new_pairs ++ pairs
  end
end
