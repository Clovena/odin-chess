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

  def move_to
    # puts 'Input a move:'
    # move = gets.chomp[0..1]
    # square_to = Board.algebraic_to_coords(move[1..])

    # piece = piece_class(move[0])
    # piece_moves = piece.new(:move, '').moves
    # piece_locs = piece_moves.map do |move|
    #   [square_to[0] - move[0], square_to[1] - move[1]]
    # end
    # square_from = piece_locs.each do |loc_arr|
    #   loc = Board.coords_to_algebraic(loc_arr)
    #   return loc.to_sym if @squares[loc.to_sym].instance_of?(piece)
    # end
    # piece_obj = @squares[square_from]
    # return unless piece_obj.nil? ||
    #               Board.available_squares(piece_obj)
    #                    .include?(Board.algebraic_to_coords(square_to))

    # @squares[square_from] = nil
    # @squares[Board.coords_to_algebraic(square_to).to_sym] = piece
    # piece.reset(Board.coords_to_algebraic(square_to))
  end

  def piece_class(char)
    case char
    when '' then Pawn
    when 'N' then Knight
    when 'B' then Bishop
    when 'R' then Rook
    when 'Q' then Queen
    when 'K' then King
    end
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
