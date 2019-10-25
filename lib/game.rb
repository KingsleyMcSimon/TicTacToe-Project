# frozen_string_literal: true

require_relative './player.rb'
require_relative './board.rb'

class Game
  # Game object should know which player's turn it is, also if the board is
  # full or not and if any player has won
  attr_accessor :p1, :p2, :board, :p1turn, :over
  def initialize(p1, p2, board)
    @p1 = p1
    @p2 = p2
    @board = board
    @p1turn = true
    @over = false
  end

  def turn(sel)
    current = @p1turn ? @p1 : @p2
    @board.take_place(sel, current)
    @over = true if @p1.winner? || @p2.winner? || @board.full
    @p1turn = @p1turn ? false : true
  end 
end