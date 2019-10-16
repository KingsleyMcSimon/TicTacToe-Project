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
    @inner[inpt-1] = play ? "O" : "X"
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

  def is_winner(curr)          # I'm using this instead of the game_verifier
    winner = false
    condition = []
    @win.each do |cond|
      f = (curr.include? cond[0]) && (curr.include? cond[1]) && (curr.include? cond[2])
      condition.push(f)
    end
    if condition.any?
      winner = true
    end
    puts @board.get_board.to_s + "\nYou Win" if winner
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

  def printboard                         # I'm using this section for the actual game and printing
    while !(is_winner(turns))
      puts @board.get_board.to_s
      unless (@board.get_board.any? { |i| i.is_a? Numeric })
        puts "No more space left to play"
        break
      end
    end
  end
end

# def taken(@p1.taken, @p2.taken)         # it's not good practice to use repeated names
#   if @p1.taken                          # also, these methods should go inside the Game class
#     puts "Wait for the next turn"       # and we already have a method to discriminate turns
#   elsif
#     @p2.taken
#     puts "You can play"
#   else
#     puts "No more space to put your token"
#   end


#   def create_win                       # we already have a winning condition defined @win
#     @win = {
#       '1', => ' ',
#       '2', => ' ',
#       '3', => ' ',
#       '4', => ' ',
#       '5', => ' ',
#       '6', => ' ',
#       '7', => ' ',
#       '8', => ' ',
#       '9', => ' ',
#     }

#   end

#   def display_result                      # We'll use this later
#     puts ""
#     puts " #{@win['1']} | #{@win['2']} | #{@win['3']}"
#     puts " #{@win['4']} | #{@win['5']} | #{@win['6']}"
#     puts " #{@win['7']} | #{@win['8']} | #{@win['9']}"
#     puts ""
#   end

#   def game_verifier                       # I'll use this in a different way
#     stop_game = false
#     if ((@win['1'] == @win['2'] && @win['1'] == @win['3']) && (@win['1'] != ' ' && @win['2'] != ' ' && @win['3'] != ' '))
#       stop_game = true
#       winning = @win['1']
      



#########################################
# Code below is just for testing purposes

gamer = Game.new
gamer.printboard