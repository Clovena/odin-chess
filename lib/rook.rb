# frozen_string_literal: true

require_relative 'board'

# Rook class
class Rook
  attr_accessor :loc, :children

  def initialize(loc = [1, 1])
    @loc = loc
    @children = Board.available_squares(self)
  end

  def moves
    moves_arr = []
    range = [*-7..7]
    range.each do |elem|
      moves_arr << [0, elem] << [elem, 0] unless elem.zero?
    end
    moves_arr
  end
end
