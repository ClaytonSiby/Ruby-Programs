# frozen_string_literal: true

# board class definition
class Board
  def initialize
    @positions = (1..9).to_a
  end

  def self.draw_board
    "
    #{@positions[0]} | #{@positions[1]} | #{@positions[2]}
    =======
    #{@positions[3]} | #{@positions[4]} | #{@positions[5]}
    =======
    #{@positions[6]} | #{@positions[7]} | #{@positions[8]}
    "
  end

  def self.valid_move?(move)
    @positions.include?(move)
  end

  def self.position_empty?(move)
    @positions[move - 1].is_a?(Integer)
  end

  def self.draw
    'Game over & it is a draw!!' if @positions.none?(Integer)
  end

  def self.make_move(move, mark)
    return 'Invalid move, enter a numbe in range 1..9' unless valid_move?(move)

    return "Position #{move} has been taken, please select another. >> " unless position_empty?(move)

    @positions[move - 1] = mark
  end
end

Board.make_move(2, "X")
