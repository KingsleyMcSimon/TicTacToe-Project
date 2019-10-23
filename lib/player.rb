# frozen_string_literal: true

class Player
  attr_accessor :name, :taken
  def initialize(name = 'Player')
    @name = name
    @taken = []
  end
end
