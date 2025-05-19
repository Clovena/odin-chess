# frozen_string_literal: true

require_relative 'board'

# Knight class
class Knight < Piece
  def moves
    [
      [2, 1],
      [1, 2],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2],
      [1, -2],
      [2, -1]
    ].freeze
  end
end
