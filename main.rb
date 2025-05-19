# frozen_string_literal: true

require_relative 'lib/piece'
require_relative 'lib/knight'
require_relative 'lib/rook'
require_relative 'lib/board'
require_relative 'lib/notation'

test_knight = Knight.new([3, 3])
puts "The knight is on #{test_knight.loc}."
puts "In chess notation, this is #{Notation.coords_to_algebraic(test_knight.loc, test_knight)}."
puts "The knight can move like: #{test_knight.moves}"
puts "The knight can move to: #{test_knight.children}"

test_rook = Rook.new([4, 5])
puts "The rook is on #{test_rook.loc}."
puts "In chess notation, this is #{Notation.coords_to_algebraic(test_rook.loc, test_rook)}."
puts "The rook can move like: #{test_rook.moves}"
puts "The rook can move to: #{test_rook.children}"
