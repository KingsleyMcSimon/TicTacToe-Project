# /usr/bin/ruby

class Player
  def initialize(name)
    @name = name
    @taken = []
  end
  def get_name
    @name
  end
  def my_turn(arg)
    @taken.push(arg)
  end
  def get_taken
    @taken
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
    @win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
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
      @p1.my_turn(get_input)
    else
      puts "Player 2:"
      @p2.my_turn(get_input)
    end
    @p1current = @p1current ? false : true
  end

  def printboard
    turns
    turns
    turns
    turns
    puts @p1.get_taken.to_s
    puts @p2.get_taken.to_s
    puts @board.get_board.to_s
  end
end


#########################################
# Code below is just for testing purposes

gamer = Game.new
gamer.printboard