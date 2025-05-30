# frozen_string_literal: true

# King class
class King < Piece
  def moves
    [
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1],
      [0, -1],
      [1, -1]
    ].freeze
  end
end
