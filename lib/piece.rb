# frozen_string_literal: true

# Piece super-class
class Piece
  attr_accessor :loc, :children

  def initialize(loc = [1, 1])
    @loc = loc
    @children = Move.available_squares(self)
  end
end
