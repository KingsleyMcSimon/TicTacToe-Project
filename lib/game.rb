# frozen_string_literal: true

require_relative './player.rb'
require_relative './board.rb'

class Game
  # Game object should know which player's turn it is, also if the board is
  # full or not and if any player has won
  attr_accessor :play1, :play2, :board, :p1turn, :over, :tie
  def initialize(play1, play2, board)
    @play1 = play1
    @play2 = play2
    @board = board
    @p1turn = true
    @over = false
    @tie = false
  end

  def turn(sel)
    current = @p1turn ? @play1 : @play2
    @board.take_place(sel, current)
    current.taken.push(sel)
    if @play1.winner? || @play2.winner?
      @over = true
      @tie = false
    elsif @board.full
      @over = true
      @tie = true
    end
    @p1turn = @p1turn ? false : true
  end
end
