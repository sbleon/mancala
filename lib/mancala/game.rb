module Mancala
  class Game

    def initialize
      @board = Board.new
      @renderer = Renderer.new(self)
      @renderer.show
    end

    def slots
      @board.slots
    end

  end
end