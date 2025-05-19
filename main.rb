# frozen_string_literal: false

require_relative 'lib/piece'
require_relative 'lib/knight'
require_relative 'lib/bishop'
require_relative 'lib/rook'
require_relative 'lib/board'
require_relative 'lib/notation'

def test_piece(piece, name)
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

test_knight = Knight.new([3, 3])
test_piece(test_knight, 'knight')

test_rook = Rook.new([4, 5])
test_piece(test_rook, 'rook')

test_bishop = Bishop.new([2, 4])
test_piece(test_bishop, 'bishop')
