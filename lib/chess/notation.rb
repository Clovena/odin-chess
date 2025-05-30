# frozen_string_literal: true

# Methods to handle notation
module Notation
  # Conversions between pgn and array notation
  def self.piece_letter(piece_obj)
    return '' if piece_obj.nil?

    piece = piece_obj.class.to_s
    case piece
    when 'Knight' then 'N'
    when 'Pawn' then ''
    else piece[0]
      # King, Queen, Rook, Bishop all convert to first letter, upcase
    end
  end

  def self.piece_class(char)
    case char
    when '' then Pawn
    when 'N' then Knight
    when 'B' then Bishop
    when 'R' then Rook
    when 'Q' then Queen
    when 'K' then King
    end
  end

  def self.coords_to_pgn(coords, piece = nil)
    piece_letter(piece) + FILES[coords[0]] + coords[1].to_s
  end

  def self.pgn_to_coords(pgn)
    pgn_array = pgn.split('')
    if pgn_array.size == 2
      [FILES.index(pgn_array[0]), pgn_array[1].to_i]
    else
      [FILES.index(pgn_array[1]), pgn_array[2].to_i]
    end
  end
end
