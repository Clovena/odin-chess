# frozen_string_literal: true

require_relative 'notation'

# Piece super-class
class Piece
  include Notation

  attr_accessor :player, :loc, :children

  def initialize(player, loc = 'a1')
    @player = player
    @loc = Notation.algebraic_to_coords(loc)
    @children = Move.available_squares(self)
  end
end
