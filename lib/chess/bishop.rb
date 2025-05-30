# frozen_string_literal: true

# Bishop class
class Bishop < Piece
  def moves
    [
      [1, 1],
      [-1, 1],
      [-1, -1],
      [1, -1]
    ].freeze
  end
end
