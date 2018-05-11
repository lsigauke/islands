defmodule IslandsEngine.Board do
  alias IslandsEngine.{Coodinate, Island}
  def new(), do: %{}

  def position_island(board, key, island) do
    case overlaps_existsing_island?(board, key, island) do
      true -> {:error, :overlapping_island}
      false -> Map.put(board, key, island)
    end
  end

  defp overlaps_existsing_island?(board, new_key, new_island) do
    Enum.any?(board, fn {key, island} ->
      key != new_key and Island.overlaps?(island, new_island)
    end)
  end

  defp all_islands_positioned?(board) do
    Enum.all?(Island.types(), &(Map.has_key?(board, &1)))
  end
end
