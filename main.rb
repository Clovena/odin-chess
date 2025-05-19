# frozen_string_literal: true

require_relative 'lib/piece'
require_relative 'lib/knight'
require_relative 'lib/rook'
require_relative 'lib/board'
require_relative 'lib/notation'

def test_piece(piece)
  puts "The knight is on #{piece.loc}."
  puts "In chess notation, this is #{Notation.coords_to_algebraic(piece.loc, piece)}."
  puts "The knight can move like: #{piece.moves}"
  puts "The knight can move to: #{piece.children}"
  puts
end

test_knight = Knight.new([3, 3])
test_piece(test_knight)

test_rook = Rook.new([4, 5])
test_piece(test_rook)
