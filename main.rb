# frozen_string_literal: false

require_relative 'lib/chess'

# def test_piece(piece)
#   name = "#{piece.player} #{piece.class}"
#   puts "The #{name} is on #{piece.loc}."
#   puts "In chess notation, this is #{Notation.coords_to_algebraic(piece.loc, piece)}."
#   puts "The #{name} can move like: #{piece.moves}"
#   puts "The #{name} can move to: "
#   move_list = ''
#   piece.children.each do |move|
#     move_list << "#{Notation.coords_to_algebraic(move)} "
#   end
#   puts move_list
#   puts
# end

board = Board.new
puts board
