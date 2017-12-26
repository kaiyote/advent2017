defmodule Advent2017.Day3 do
  @moduledoc ~S"""
  Day 3

  ## Examples

      iex> part1 1
      0
      iex> part1 12
      3
      iex> part1 23
      2
      iex> part1 1024
      31
      iex> part1 Advent2017.Input.day3
      480

      iex> part2 Advent2017.Input.day3
      0
  """

  def part1(input) do
    {length, steps_in} = edge_length input
    center = edge_center input, length

    input - center + steps_in
  end

  def part2(_input) do
    0
  end

  defp edge_length(num) do
    1
    |> Stream.iterate(&Kernel.+(&1, 2))
    |> Stream.with_index()
    |> Stream.drop_while(fn {x, _} -> x * x < num end)
    |> Enum.at(0)
  end

  defp edge_center(num, length) do
    corners = for x <- [0, 1, 2, 3], do: length * (length - x) + (1 * x)
    if num in corners do
      num - div(length, 2)
    else
      corner = corners |> Enum.drop_while(fn x -> x > num + length - 1 end) |> Enum.at(0)
      corner - div(length, 2)
    end
  end
end
