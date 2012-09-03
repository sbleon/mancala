module Mancala
  class Game

    def initialize
      @board = Board.new
    end

    def move(slot)
      @board.move(slot)
    end

    def slots
      @board.slots
    end

  end
end