# frozen_string_literal: true

require_relative 'board'

# Rook class
class Piece
  attr_accessor :loc, :children

  def initialize(loc = [1, 1])
    @loc = loc
    @children = Board.available_squares(self)
  end
end
