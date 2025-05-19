# frozen_string_literal: true

require_relative 'board'
require_relative 'move'

# Knight class
class Knight
  MOVEMENT = [
    [2, 1],
    [1, 2],
    [-1, 2],
    [-2, 1],
    [-2, -1],
    [-1, -2],
    [1, -2],
    [2, -1]
  ].freeze

  attr_accessor :loc, :children

  def initialize(loc = [1, 1])
    @loc = loc
    @children = Board.available_squares(self)
  end

  def moves
    MOVEMENT
  end
end
