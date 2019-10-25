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
end
