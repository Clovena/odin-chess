# frozen_string_literal: true

# Pawn class
class Pawn < Piece
  def moves
    if @player == :black
      moves_arr = [[0, -1]]
      moves_arr << [0, -2] unless moved
    else
      moves_arr = [[0, 1]]
      moves_arr << [0, 2] unless moved
    end
    moves_arr
  end
end
