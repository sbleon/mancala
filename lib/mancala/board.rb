module Mancala
  class Board

    def initialize
      @slots = [4,4,4,4,4,4,4,4,4,4,4,4,4,4]
    end

    def move(slot)
      # How many stones are we moving?
      stones = slots[slot]

      # Remove all stones from the selected slot
      slots[slot] = 0

      # Put one stone in each slot, moving counter-clockwise
      stones.times do |n|
        slots[slot - (n + 1)] += 1
      end
    end

    def slots
      @slots
    end
  end
end