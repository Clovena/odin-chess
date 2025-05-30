# frozen_string_literal: true

# Methods to manipulate piece placement
module Move
  def self.available_squares(piece_obj)
    loc = pgn_to_coords(piece_obj.loc)
    moves = piece_obj.moves
    squares = []
    moves.each_index do |m|
      coords = [loc[0] + moves[m][0], loc[1] + moves[m][1]]
      squares << coords_to_pgn(coords) if valid_square?(coords)
    end
    squares
  end

  def self.valid_square?(coords)
    return true if coords[0].between?(1, SIZE) && coords[1].between?(1, SIZE)

    false
  end
end
