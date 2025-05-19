# frozen_string_literal: true

# Methods for all objects that live on the Board
module Move
  SIZE = 8
  FILES = [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze

  def self.files
    FILES
  end

  def self.to(piece, coords)
    piece.loc = coords if available_squares(piece).include?(coords)
    # puts Board.coords_to_algebraic(coords, piece) # Delete later
  end

  def self.available_squares(piece)
    moves = piece.moves
    squares = []
    moves.each_index do |m|
      coords = [piece.loc[0] + moves[m][0], piece.loc[1] + moves[m][1]]
      squares << coords if valid_square?(coords)
    end
    squares
  end

  def self.valid_square?(coords)
    return true if coords[0].between?(1, SIZE) && coords[1].between?(1, SIZE)

    false
  end
end
