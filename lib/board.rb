# frozen_string_literal: true

# Board class
class Board
  attr_accessor :squares

  def initialize
    @squares = {}
    setup
  end

  def setup # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength
    ('a'..'h').each do |file|
      # Place pawns
      @squares["#{file}2"] = Pawn.new(:white, "#{file}2")
      @squares["#{file}7"] = Pawn.new(:black, "#{file}7")

      case file
      when 'a' || 'h'
        @squares["#{file}1"] = Rook.new(:white, "#{file}1")
        @squares["#{file}8"] = Rook.new(:black, "#{file}8")
      when 'b' || 'g'
        @squares["#{file}1"] = Knight.new(:white, "#{file}1")
        @squares["#{file}8"] = Knight.new(:black, "#{file}8")
      when 'c' || 'f'
        @squares["#{file}1"] = Bishop.new(:white, "#{file}1")
        @squares["#{file}8"] = Bishop.new(:black, "#{file}8")
      when 'd'
        @squares["#{file}1"] = Queen.new(:white, "#{file}1")
        @squares["#{file}8"] = Queen.new(:black, "#{file}8")
      when 'e'
        @squares["#{file}1"] = King.new(:white, "#{file}1")
        @squares["#{file}8"] = King.new(:black, "#{file}8")
      end
    end
  end
end
