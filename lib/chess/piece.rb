# frozen_string_literal: true

require_relative 'notation'

# Piece super-class
class Piece
  include Notation

  attr_accessor :player, :sym, :loc, :children

  def initialize(player, sym, loc = 'a1')
    @player = player
    @sym = sym
    @loc = Notation.algebraic_to_coords(loc)
    @children = Move.available_squares(self)
  end
end
