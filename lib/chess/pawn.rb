# frozen_string_literal: true

# Pawn class
class Pawn < Piece
  def moves
    moves_arr = [[0, 1]]
    moves_arr << [0, 2] # unless moved?
    moves_arr
  end
end
