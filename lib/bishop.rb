# frozen_string_literal: true

# Rook class
class Bishop < Piece
  def moves
    moves_arr = []
    range = [*-7..7]
    range.each do |elem|
      moves_arr << [elem, elem] << [-elem, elem] unless elem.zero?
    end
    moves_arr
  end
end
