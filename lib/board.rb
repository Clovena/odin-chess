# frozen_string_literal: true

# Methods for all objects that live on the Board
module Board
  SIZE = 8
  FILES = [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze

  def self.valid_square?(coords)
    return true if coords[0].between?(1, SIZE) && coords[1].between?(1, SIZE)

    false
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

  ### Methods to convert between coordinates and algebraic notation
  def self.piece_letter(obj)
    return '' if obj.nil?

    piece = obj.class.to_s
    case piece
    when 'Knight' then 'N'
    when 'Pawn' then ''
    else piece[0]
      # King, Queen, Rook, Bishop all convert to first letter, upcase
    end
  end

  def self.coords_to_algebraic(coords, piece = nil)
    piece_letter(piece) + FILES[coords[0]] + coords[1].to_s
  end

  def self.algebraic_to_coords(alg)
    alg_arr = alg.split('')
    [
      FILES.index(alg_arr[0]),
      alg_arr[1].to_i
    ]
  end
end
