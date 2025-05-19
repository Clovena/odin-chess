# frozen_string_literal: true

# Rook class
class King < Piece
  def moves
    moves_arr = []
    range = [-1, 1]
    range.each do |elem|
      moves_arr << [elem, elem] << [-elem, elem] # Rank/file moves
      moves_arr << [0, elem] << [elem, 0] # Diagonal moves
    end
    moves_arr
  end
end
