#!/usr/bin/ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

def welcome
  # Welcome screen (to only be displayed when game starts)
  %(
  Welcome to Tic Tac Toe. \n
  Tic Tac Toe is a popular 2-player game in which the goal is to get 3
  similar symbols in line, be it horizontally, vertically or diagonally
  on a 3x3 drawn grid. The players alternate turns until there is a winner
  or the board is full, if there's no winner the game results in a tie.)
end

def o_or_x(player)
  # This ensures that the input is either 'O' or 'X'
  # if input is just blank, it defaults to 'O'
  puts "\nPlease select 'O' or 'X' for #{player}. (Default = 'O')"
  sel = gets.chomp.upcase
  sel = 'O' if sel == ''
  if %w[O X].include? sel
    sel
  else
    puts 'Not a valid option, please try again'
    o_or_x(player)
  end
end

def player_set
  # Sets up the names of the players and which symbol they'll use
  players = []
  2.times do |i|
    puts "\nType a name for Player #{i + 1} (default = Player#{i + 1})"
    p = gets.chomp.capitalize
    p = p == '' ? "Player#{i + 1}" : p
    puts "Player #{i + 1}'s name set as '#{p}'"
    players.push(p)
  end
  sel = o_or_x(players[0])
  sel2 = sel == 'O' ? 'X' : 'O'
  puts "#{players[0]} will be '#{sel}'\n#{players[1]} will be '#{sel2}'"
  [players[0], sel, players[1], sel2]
end

def valid_turn(arr)
  # This is to ensure that whatever is taken from the input, can be taken
  # from the board.
  selection = gets.chomp.to_i
  if arr.include? selection
    selection
  else
    puts "That's not a valid input, try again"
    valid_turn(arr)
  end
end

def game_reset
  # This is the actual game with its mechanics.
  board = Board.new
  inputs = player_set
  p1 = Player.new(inputs[0], inputs[1])
  p2 = Player.new(inputs[2], inputs[3])
  game = Game.new(p1, p2, board)
  puts board.draw
  until game.over
    str = ', please select a position'
    str = game.p1turn ? p1.name + str : p2.name + str
    puts str
    game.turn(valid_turn(board.inner))
    puts board.draw
  end
  puts "#{p1.name} Wins!" if p1.winner?
  puts "#{p2.name} Wins!" if p2.winner?
  puts 'This ended in a tie.' if game.tie
end

puts welcome
game_reset
