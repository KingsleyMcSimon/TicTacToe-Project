# frozen_string_literal: true

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
