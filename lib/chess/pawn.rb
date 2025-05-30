# frozen_string_literal: true

# Pawn class
class Pawn < Piece
  def moves
    moves_arr = [[0, 1]]
    moves_arr << [0, 2] unless moved
    return moves_arr.collect(&:-@) if @player == :black

    moves_arr
  end
end
