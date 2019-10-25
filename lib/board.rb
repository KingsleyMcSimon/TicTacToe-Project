# frozen_string_literal: true

class Board
  # Board object should know which spaces are taken and which are not
  # it should also know if it's full or not
  attr_accessor :inner, :full
  def initialize
    @inner = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @full = false
  end

  def take_place(inpt, player)
    @inner[inpt - 1] = player.symbol
    @full = true unless @inner.any? { |i| i.is_a? Numeric }
  end

  def draw
    # Draws the current board
    rows = ["\n"]
    rowstring = '    '
    @inner.each_with_index do |v, i|
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
end