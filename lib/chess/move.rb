# frozen_string_literal: true

# Methods to manipulate piece placement
module Move
  def self.possible_pieces(move, board)
    target_class = Notation.piece_class(move[-3])
    target_square = move[-2..]
    board.squares.select do |_key, piece|
      piece.instance_of?(target_class) &&
        piece.children.include?(target_square)
    end
  end

  def self.available_squares(piece_obj)
    loc = pgn_to_coords(piece_obj.loc)
    moves = piece_obj.moves
    squares = []
    moves.each_index do |m|
      coords = [loc[0] + moves[m][0], loc[1] + moves[m][1]]
      squares << coords_to_pgn(coords) unless invalid_square?(coords)
    end
    squares
  end

  def self.legal_move?(coords, board)
    loc = Notation.coords_to_pgn(coords)
    return false if invalid_square?(coords) || occupied_square?(loc, board)

    true
  end

  def self.invalid_square?(coords)
    return false if coords[0].between?(1, Dim.size) && coords[1].between?(1, Dim.size)

    true
  end

  def self.occupied_square?(loc, board)
    return false if board.squares[:"#{loc}"].nil? # || WIP NEED COLOR MISMATCH

    true
  end
end
