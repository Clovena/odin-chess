# frozen_string_literal: true

# Piece super-class
class Piece
  attr_accessor :player, :sym, :loc, :children, :moved

  def initialize(player = :white, sym = '', loc = 'a1')
    @player = player
    @sym = sym
    @loc = loc
    @children = nil
    @moved = false
  end
end
