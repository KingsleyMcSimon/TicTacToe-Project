# frozen_string_literal: true

class Player
  # Player should know its name, the selections it has taken from board,
  # the symbol that it will use and if he's taken a winner combo
  attr_accessor :name, :taken, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @taken = []
    @win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
            [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def winner?
    winner = false
    condition = []
    @win.each do |cond|
      f = (@taken.include? cond[0]) && (@taken.include? cond[1]) && (@taken.include? cond[2])
      condition.push(f)
    end
    winner = true if condition.any?
    winner
  end
end
