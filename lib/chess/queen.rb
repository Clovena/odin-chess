# frozen_string_literal: true

# Queen class
class Queen < Piece
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
