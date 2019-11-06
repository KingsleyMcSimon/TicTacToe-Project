require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

describe Player do
  context "Player should be able to assign its name and return it" do
    it "returns its name when .name is called" do
      p1 = Player.new("Player1", "X")
      expect(p1.name).to be_instance_of(String)
    end
  end
  context "Player should be able to know its symbol and return it" do
    it "returns its name when .name is called" do
      p1 = Player.new("Player1", "X")
      expect(p1.symbol).to eq ("X")
    end
  end
  context "Player should be able to tell if it won or not" do
    it "returns true if player has a winning combination in its 'taken' list" do
      p1 = Player.new("Player1", "X")
      expect(p1.winner?).to eq false
      p1.taken = [1, 2, 3]
      expect(p1.winner?).to eq true
    end
  end
end

describe Board do
  context "Board should be able to draw itself" do
    it "returns an array" do
      board = Board.new
      expect(board.draw).to be_instance_of(Array)
    end
  end
  context "Board should be able to change its values with player's symbol" do
    it "should change its inner variable to match the input" do
      board = Board.new
      p1 = Player.new("Player1", "X")
      board.inner = ["X", "O", "X", "X", "O", "O", 7, "X", "O"] # to simulate last turn
      expect(board.full).to be false
      board.take_place(7, p1) # to select the last available option
      expect(board.full).to be true
    end
  end
end

describe Game do
  context "Game should know whose turn it is" do
    it "should toggle its p1turn value when its turn method is called" do
      board = Board.new
      p1 = Player.new("player1", "X")
      p2 = Player.new("player2", "O")
      game = Game.new(p1, p2, board)
      expect(game.p1turn).to be true
      game.turn(1)
      expect(game.p1turn).to be false
    end
  end
end