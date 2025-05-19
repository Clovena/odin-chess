# frozen_string_literal: true

# Piece super-class
class Piece
  attr_accessor :player, :sym, :loc, :children

  def initialize(player, sym, loc = 'a1')
    @player = player
    @sym = sym
    @loc = Board.algebraic_to_coords(loc)
    @children = Board.available_squares(self)
  end
end
