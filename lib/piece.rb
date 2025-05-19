# frozen_string_literal: true

# Piece super-class
class Piece
  attr_accessor :player, :loc, :children

  def initialize(player, loc = [1, 1])
    @player = player
    @loc = loc
    @children = Move.available_squares(self)
  end
end
