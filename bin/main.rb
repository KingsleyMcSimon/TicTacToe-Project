#!/usr/bin/ruby

class Player
  attr_accessor :name, :taken
  def initialize(name = 'Player')
    @name = name
    @taken = []
  end
end

class Board
  attr_accessor :inner
  def initialize
    @inner = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_place(inpt, play)
    @inner[inpt - 1] = play ? 'o' : 'x'
  end

  def draw_board
    puts "\n " + @inner[0].to_s + ' | ' + @inner[1].to_s + ' | ' + @inner[2].to_s + ' '
    puts '-----------'
    puts ' ' + @inner[3].to_s + ' | ' + @inner[4].to_s + ' | ' + @inner[5].to_s + ' '
    puts '-----------'
    puts ' ' + @inner[6].to_s + ' | ' + @inner[7].to_s + ' | ' + @inner[8].to_s + " \n\n"
  end
end

class Game
  def initialize
    @board = Board.new
    @p1 = Player.new("P1")
    @p2 = Player.new("P2")
    @win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
            [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @p1current = true
  end

  def get_input
    gotten = gets.chomp.to_i
    if @board.get_board.include? gotten
      @board.take_place(gotten, @p1current)
      gotten
    else
      puts "Your selection is not in the board, try again"
      get_input
    end
  end

  def is_winner(curr)
    winner = false
    condition = []
    @win.each do |cond|
      f = (curr.include? cond[0]) && (curr.include? cond[1]) && (curr.include? cond[2])
      condition.push(f)
    end
    if condition.any?
      winner = true
    end
    @board.draw_board
    puts "\nYou Win" if winner
    winner
  end

  def turns
    if @p1current
      puts "Player 1:"
      @p1.taken.push(get_input)
    else
      puts "Player 2:"
      @p2.taken.push(get_input)
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
    while !(is_winner(turns))
      @board.draw_board
      unless (@board.get_board.any? { |i| i.is_a? Numeric })
        puts "No more space left to play"
        break
      end
    end
  end
end

#########

game = Game.new
game.printboard