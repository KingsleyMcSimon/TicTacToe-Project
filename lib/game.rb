# frozen_string_literal: true

require_relative './player.rb'
require_relative './board.rb'

class Game
  def initialize
    @board = Board.new
    @p1 = Player.new('P1')
    @p2 = Player.new('P2')
    @win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
            [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @p1current = true
  end

  def input_check
    gotten = gets.chomp.to_i
    if @board.inner.include? gotten
      @board.take_place(gotten, @p1current)
      gotten
    else
      puts 'Your selection is not in the board, try again'
      input_check
    end
  end

  def winner?(curr)
    winner = false
    condition = []
    @win.each do |cond|
      f = (curr.include? cond[0]) && (curr.include? cond[1]) && (curr.include? cond[2])
      condition.push(f)
    end
    winner = true if condition.any?
    @board.draw_board
    puts "\nYou Win" if winner
    winner
  end

  def turns
    if @p1current
      puts 'Player 1:'
      @p1.taken.push(input_check)
    else
      puts 'Player 2:'
      @p2.taken.push(input_check)
    end
    if @p1current
      @p1current = false
      return @p1.taken
    else
      @p1current = true
      return @p2.taken
    end
  end

  def printboard
    @board.draw_board
    until winner?(turns)
      @board.draw_board
      unless @board.inner.any? { |i| i.is_a? Numeric }
        puts 'No more space left to play'
        break
      end
    end
  end
end
