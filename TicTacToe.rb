# /usr/bin/ruby

class Player
  @name
  def initialize(name)
    @name = name
  end
  def get_name
    @name
  end
end

class Board
  def initialize(p1="x")
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  def get_board
    @board
  end
end

class Game
  def initialize
    @x = Board.new
    @p1 = Player.new("P1")
    @p2 = Player.new("P2")
  end
  def printboard
    puts @x.get_board.to_s, @p1.get_name, @p2.get_name
  end
end

#########################################
# Code below is just for testing purposes

gamer = Game.new
gamer.printboard