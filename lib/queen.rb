# frozen_string_literal: true

# Rook class
class Queen < Piece
  def moves
    moves_arr = []
    range = [*-7..7]
    range.each do |elem|
      unless elem.zero?
        moves_arr << [elem, elem] << [-elem, elem] # Rank/file moves
        moves_arr << [0, elem] << [elem, 0] # Diagonal moves
      end
    end
    moves_arr
  end
end
