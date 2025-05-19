# frozen_string_literal: false

require_relative 'lib/chess'

board = Board.new
knight = board.squares[:b1]
board.move_to('b1', 'c3')

p knight
puts board
