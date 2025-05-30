# frozen_string_literal: false

# Board class
class Board
  attr_accessor :squares, :size, :files

  def initialize
    @squares = {}
    @size = 8
    @files = [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze
    setup
    gather_children
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

  # Further methods to initialize board
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

  def gather_children
    squares.each_value do |piece|
      next if piece.nil?

      if [Pawn, Knight, King].include?(piece.class)
        piece.children = obtain_moves(piece, false)
      elsif [Bishop, Rook, Queen].include?(piece.class)
        piece.children = obtain_moves(piece, true)
      end
    end
  end

  def obtain_moves(piece, iterative)
    coords = Notation.pgn_to_coords(piece.loc, files)
    children = []
    piece.moves.each do |move|
      children << check_child(coords, move, iterative)
    end
    children.flatten.compact.uniq
  end

  def check_child(coords, move, iterative, children = [])
    target = [coords[0] + move[0],
              coords[1] + move[1]]
    return unless Move.legal_move?(target, self)

    children << Notation.coords_to_pgn(target, self)
    check_child(target, move, iterative, children) if iterative
    children
  end
end
