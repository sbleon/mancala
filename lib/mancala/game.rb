module Mancala
  class Game
    def self.start(output = STDOUT)
      @output = output
      @board = Board.new
      @board.display(@output)
    end
  end
end