defmodule Advent2017.Day5 do
  @moduledoc ~S"""
  Day 5

  ## Examples

      iex> part1 "0
      ...>        3
      ...>        0
      ...>        1
      ...>        -3"
      5
      iex> part1 Advent2017.Input.day5
      373543

      iex> part2 "0
      ...>        3
      ...>        0
      ...>        1
      ...>        -3"
      10
      iex> part2 Advent2017.Input.day5
      27502966
  """

  def part1(input) do
    input
    |> prepare_input()
    |> process_instruction()
  end

  def part2(input) do
    input
    |> prepare_input()
    |> process_instruction_2()
  end

  defp prepare_input(input) do
    input
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&(&1 |> String.trim() |> String.to_integer()))
  end

  defp process_instruction(instructions, current_index \\ 0, steps \\ 0)
  defp process_instruction(instructions, current_index, steps)
    when current_index >= length(instructions) or current_index < 0 do
    steps
  end
  defp process_instruction(instructions, current_index, steps) do
    move = Enum.at(instructions, current_index)

    instructions
    |> List.update_at(current_index, &Kernel.+(&1, 1))
    |> process_instruction(current_index + move, steps + 1)
  end

  defp process_instruction_2(instructions, current_index \\ 0, steps \\ 0)
  defp process_instruction_2(instructions, current_index, steps)
    when current_index >= length(instructions) or current_index < 0 do
    steps
  end
  defp process_instruction_2(instructions, current_index, steps) do
    move = Enum.at(instructions, current_index)

    instructions
    |> List.update_at(current_index, fn x -> if x >= 3, do: x - 1, else: x + 1 end)
    |> process_instruction_2(current_index + move, steps + 1)
  end
end
