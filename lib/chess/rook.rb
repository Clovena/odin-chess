# frozen_string_literal: true

# Rook class
class Rook < Piece
  def moves
    moves_arr = []
    range = [*-7..7]
    range.each do |elem|
      moves_arr << [0, elem] << [elem, 0] unless elem.zero?
    end
    moves_arr
  end
end
