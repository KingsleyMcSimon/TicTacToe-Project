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

def draw_board(board)
  # Draws the current board based on the list that's provided
  rows = ["\n"]
  rowstring = '    '
  board.each_with_index do |v, i|
    box = ' ' + v.to_s + ' '
    rowstring = i % 3 == 2 ? rowstring + box : rowstring + box + '|'
    next if i % 3 != 2
    rows.push(rowstring)
    rows.push('    ---+---+---')
    rowstring = '    '
  end
  rows.pop
  rows.push("\n")
  rows
end

def o_or_x(player)
  puts "\nPlease select 'O' or 'X' for #{player}. (Default = 'O')"
  sel = gets.chomp.upcase
  sel = 'O' if sel == ''
  if %w(O X).include? sel
    sel
  else
    puts 'Not a valid option, please try again'
    o_or_x(player)
  end
end

def player_set
  players = []
  2.times do |i|
    puts "\nType a name for Player #{i + 1} (default = Player #{i + 1})"
    p = gets.chomp.capitalize
    p = p == '' ? "Player #{i + 1}" : p
    puts "Player #{i + 1}'s name set as '#{p}'"
    players.push(p)
  end
  sel = o_or_x(players[0])
  sel2 = sel == 'O' ? 'X' : 'O'
  puts "#{players[0]} will be '#{sel}'\n#{players[1]} will be '#{sel2}'"
  [players[0], sel, players[1], sel2]
end

board = Board.new
puts welcome
inputs = player_set
p1 = Player.new(inputs[0], inputs[1])
p2 = Player.new(inputs[2], inputs[3])
game = Game.new(p1, p2, board)
puts draw_board(board.inner)
until game.over
  str = ', please select a position'
  str = game.p1turn ? p1.name + str : p2.name + str
  puts str
  game.turn(gets.chomp.to_i)
  puts draw_board(board.inner)
end
puts "#{p1.name} won" if p1.winner?
puts "#{p2.name} won" if p2.winner?
puts 'This ended in a tie.' if game.tie
