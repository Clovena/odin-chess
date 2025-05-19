# frozen_string_literal: false

# Board class
class Board
  SIZE = 8
  FILES = [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze

  attr_accessor :squares, :files

  def initialize
    @squares = {}
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
      elsif file == 'd'
        @squares[:"#{file}1"] = Queen.new(:white, '♕', "#{file}1")
        @squares[:"#{file}8"] = Queen.new(:black, '♛', "#{file}8")
      elsif file == 'e'
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

  def move_to(from, to)
    from_key = from.to_sym
    piece = @squares[from_key]
    return if piece.nil? || available_squares(piece).include?(algebraic_to_coords(to))

    @squares[from_key] = nil
    @squares[to.to_sym] = piece

    piece.loc = coords if available_squares(piece).include?(coords)
  end

  def self.available_squares(piece)
    moves = piece.moves
    squares = []
    moves.each_index do |m|
      coords = [piece.loc[0] + moves[m][0], piece.loc[1] + moves[m][1]]
      squares << coords if valid_square?(coords)
    end
    squares
  end

  def self.valid_square?(coords)
    return true if coords[0].between?(1, SIZE) && coords[1].between?(1, SIZE)

    false
  end

  # Conversions between algebraic and array notation
  def self.piece_letter(piece_obj)
    return '' if piece_obj.nil?

    piece = piece_obj.class.to_s
    case piece
    when 'Knight' then 'N'
    when 'Pawn' then ''
    else piece[0]
      # King, Queen, Rook, Bishop all convert to first letter, upcase
    end
  end

  def self.coords_to_algebraic(coords, piece = nil)
    piece_letter(piece) + FILES[coords[0]] + coords[1].to_s
  end

  def self.algebraic_to_coords(alg)
    alg_arr = alg.split('')
    [
      FILES.index(alg_arr[0]),
      alg_arr[1].to_i
    ]
  end
end
