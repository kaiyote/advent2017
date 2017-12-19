defmodule Advent2017.Day1 do
  @moduledoc ~S"""
  Day 1

  ## Examples

      iex> part1 Advent2017.Input.day1
      1097

      iex> part2 Advent2017.Input.day1
      1188
  """

  def part1(input) do
    input
    |> String.split("", trim: true)
    |> Enum.chunk_every(2, 1, [String.first(input)])
    |> Enum.filter(fn [x, y] -> x == y end)
    |> Enum.map(fn [x, _] -> String.to_integer x end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> String.split_at(div(String.length(input), 2))
    |> (fn {x, y} -> [x, y] end).()
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.zip()
    |> Enum.filter(fn {x, y} -> x == y end)
    |> Enum.map(fn {x, _} -> String.to_integer x end)
    |> Enum.sum()
    |> (fn x -> x * 2 end).()
  end
end
