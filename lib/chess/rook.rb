# frozen_string_literal: true

# Rook class
class Rook < Piece
  def moves
    [
      [1, 0],
      [0, 1],
      [-1, 0],
      [0, -1]
    ].freeze
  end
end
