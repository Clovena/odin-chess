# frozen_string_literal: true

# Methods for piece movement
module Move
  include Board

  def self.to(piece, coords)
    piece.loc = coords if Board.available_squares(piece).include?(coords)
    puts Board.coords_to_algebraic(coords, piece) # Delete later
  end
end
