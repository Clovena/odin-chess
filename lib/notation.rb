# frozen_string_literal: true

# Methods to convert between coordinates and algebraic notation
module Notation
  include Move

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
