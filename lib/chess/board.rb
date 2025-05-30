# frozen_string_literal: false

# Board class
class Board
  attr_accessor :squares, :size, :files

  def initialize
    @squares = {}
    @size = 8
    @files = [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze
    setup
  end

  def setup # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    ('a'..'h').each do |file|
      # Place pawns
      @squares[:"#{file}2"] = Pawn.new(:white, '♙', "#{file}2")
      @squares[:"#{file}7"] = Pawn.new(:black, '♟', "#{file}7")

      if %w[a h].include?(file)
        @squares[:"#{file}1"] = Rook.new(:white, '♖', "#{file}1")
        @squares[:"#{file}8"] = Rook.new(:black, '♜', "#{file}8")
      elsif %w[b g].include?(file)
        @squares[:"#{file}1"] = Knight.new(:white, '♘', "#{file}1")
        @squares[:"#{file}8"] = Knight.new(:black, '♞', "#{file}8")
      elsif %w[c f].include?(file)
        @squares[:"#{file}1"] = Bishop.new(:white, '♗', "#{file}1")
        @squares[:"#{file}8"] = Bishop.new(:black, '♝', "#{file}8")
      elsif 'd'.include?(file)
        @squares[:"#{file}1"] = Queen.new(:white, '♕', "#{file}1")
        @squares[:"#{file}8"] = Queen.new(:black, '♛', "#{file}8")
      elsif 'e'.include?(file)
        @squares[:"#{file}1"] = King.new(:white, '♔', "#{file}1")
        @squares[:"#{file}8"] = King.new(:black, '♚', "#{file}8")
      end
    end
  end

  def to_s
    8.downto(1) do |rank|
      output = ''
      ('a'..'h').each do |file|
        piece = @squares[:"#{file}#{rank}"]
        output << (piece.nil? ? '▢' : piece.sym) << ' '
      end
      puts output
    end
  end
end
