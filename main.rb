# frozen_string_literal: true

require_relative 'lib/knight'
require_relative 'lib/board'
require_relative 'lib/move'
require_relative 'lib/notation'

test_knight = Knight.new
p test_knight.loc
p test_knight.moves
puts Notation.piece_letter(test_knight)
puts Notation.coords_to_algebraic(test_knight.loc, test_knight)
