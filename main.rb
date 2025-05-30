# frozen_string_literal: false

require_relative 'lib/chess'

board = Board.new
puts board

puts Move.occupied_square?(board, 'a1') # should be true
puts Move.occupied_square?(board, 'd4') # should be false
