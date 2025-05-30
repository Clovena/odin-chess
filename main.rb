# frozen_string_literal: false

require_relative 'lib/chess'

board = Board.new
board.squares[:d2] = nil
p board
