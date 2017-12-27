defmodule Advent2017.Day4 do
  @moduledoc ~S"""
  Day 4

  ## Examples

      iex> valid? "aa bb cc dd ee"
      true
      iex> valid? "aa bb cc dd aa"
      false
      iex> valid? "aa bb cc dd aaa"
      true

      iex> valid_2? "abcde fghij"
      true
      iex> valid_2? "abcde xyz ecdab"
      false
      iex> valid_2? "a ab abc abd abf abj"
      true
      iex> valid_2? "iiii oiii ooii oooi oooo"
      true
      iex> valid_2? "oiii ioii iioi iiio"
      false

      iex> part1 Advent2017.Input.day4
      383

      iex> part2 Advent2017.Input.day4
      265
  """

  def part1(input) do
    input
    |> String.split(~r/\n/, trim: true)
    |> Enum.filter(&valid?/1)
    |> Enum.count()
  end

  def part2(input) do
    input
    |> String.split(~r/\n/, trim: true)
    |> Enum.filter(&valid_2?/1)
    |> Enum.count()
  end

  def valid?(line) do
    words = line |> String.split(~r/\s+/, trim: true)
    uniqued_words = words |> Enum.uniq()

    Enum.count(words) == Enum.count(uniqued_words)
  end

  def valid_2?(line) do
    word_letters = line
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&(&1 |> String.split("", trim: true) |> Enum.sort()))

    uniqued_word_letters = word_letters |> Enum.uniq()

    Enum.count(word_letters) == Enum.count(uniqued_word_letters)
  end
end
