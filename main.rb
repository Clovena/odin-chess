# frozen_string_literal: false

require_relative 'lib/piece'
require_relative 'lib/pawn'
require_relative 'lib/knight'
require_relative 'lib/bishop'
require_relative 'lib/rook'
require_relative 'lib/queen'
require_relative 'lib/king'
require_relative 'lib/move'
require_relative 'lib/notation'

def test_piece(piece)
  name = "#{piece.player} #{piece.class}"
  puts "The #{name} is on #{piece.loc}."
  puts "In chess notation, this is #{Notation.coords_to_algebraic(piece.loc, piece)}."
  puts "The #{name} can move like: #{piece.moves}"
  puts "The #{name} can move to: "
  move_list = ''
  piece.children.each do |move|
    move_list << "#{Notation.coords_to_algebraic(move)} "
  end
  puts move_list
  puts
end

test_pawn = Pawn.new(:white, [1, 2])
test_piece(test_pawn)
