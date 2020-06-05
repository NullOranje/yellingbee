defmodule YellingBee do
  @moduledoc """
  Documentation for `YellingBee`.
  """

  def solve(dictionary, key) do
    stream_dictionary(dictionary)
    |> filter_dictionary(key)
    |> Enum.to_list()
  end

  defp stream_dictionary(dictionary) do
    dictionary
    |> File.stream!([:ascii])
    |> Stream.map(&String.trim/1)
    |> Stream.filter(&filter_size/1)
    |> Stream.map(&String.downcase/1)
  end

  defp filter_dictionary(dictionary, key) do
    must_have = hd(key)

    dictionary
    |> Stream.filter(&filter_size/1)
    |> Stream.filter(&all_letters?(&1, key))
    |> Stream.filter(&has_required_letter?(&1, must_have))
  end

  defp all_letters?(input, may_have) do
    input
    |> String.codepoints()
    |> Enum.all?(fn i ->
      Enum.member?(may_have, i)
    end)
  end

  defp has_required_letter?(input, must_have) do
    input
    |> String.contains?(must_have)
  end

  defp filter_size(input) do
    String.length(input) >= 4
  end
end
