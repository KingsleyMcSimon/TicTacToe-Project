# /usr/bin/ruby

class Player
  attr_accessor :name, :taken
  def initialize(name="Player")
    @name = name
    @taken = []
  end
end

class Board
  def initialize(p1="x")
    @inner = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  def get_board
    @inner
  end
  def take_place(inpt, play)
    @inner[inpt-1] = play ? "X" : "O"
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

  def turns
    if @p1current
      puts "Player 1:"
      @p1.taken.push(get_input)
    else
      puts "Player 2:"
      @p2.taken.push(get_input)
    end
    @p1current = @p1current ? false : true
  end

  def printboard
    turns
    turns
    turns
    turns
    puts @p1.taken.to_s
    puts @p2.taken.to_s
    puts @board.get_board.to_s
  end
end

def taken(@p1.taken, @p2.taken)
  if @p1.taken
    puts "Wait for the next turn"
  elsif
    @p2.taken
    puts "You can play"
  else
    puts "No more space to put your token"
  end


  def create_win
    @win = {
      '1', => ' ',
      '2', => ' ',
      '3', => ' ',
      '4', => ' ',
      '5', => ' ',
      '6', => ' ',
      '7', => ' ',
      '8', => ' ',
      '9', => ' ',
    }

  end

  def display_result
    puts ""
    puts " #{@win['1']} | #{@win['2']} | #{@win['3']}"
    puts " #{@win['4']} | #{@win['5']} | #{@win['6']}"
    puts " #{@win['7']} | #{@win['8']} | #{@win['9']}"
    puts ""
  end

  def game_verifier
    stop_game = false
    if ((@win['1'] == @win['2'] && @win['1'] == @win['3']) && (@win['1'] != ' ' && @win['2'] != ' ' && @win['3'] != ' '))
      stop_game = true
      winning = @win['1']
    elsif





#########################################
# Code below is just for testing purposes

gamer = Game.new
gamer.printboard