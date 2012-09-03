require 'gosu'

module Mancala

  module ZOrder
    Background, Stone = *0..1
  end

  module BoardGeometry
    STONE_RADIUS = 10

    def x_center(pot_number)
      raise RuntimeError, 'pot_number must be between 0 and 13' unless (0..13).include?(pot_number)

      case pot_number
        when (0..6)
          145 + pot_number * 99
        when (7..12)
          145 + (12 - pot_number) * 99
        else
          45
      end
    end

    def y_center(pot_number)
      raise RuntimeError, 'pot_number must be between 0 and 13' unless (0..13).include?(pot_number)

      case pot_number
        when (0..5)
          240
        when (7..12)
          340
        when 6
          290
        when 13
          290
      end
    end
  end

  class Renderer < ::Gosu::Window

    include BoardGeometry

    def initialize(game)
      @game = game
      @height = 600
      @width = 800
      super(@width, @height, false, 0)
      self.caption = "Mancala"

      @background_image = ::Gosu::Image.new(self, 'images/board_gray.png')
      @stone_image = ::Gosu::Image.new(self, 'images/stone_black.png')
    end

    def draw
      @background_image.draw(0, 0, ZOrder::Background)
      @game.slots.each_with_index do |slot, slot_num|
        slot.times do |stone_num|
          place_stone(slot_num, stone_num)
        end
      end
    end

    def update
    end

    def place_stone(pot, stone_num)
      stone_x = x_center(pot) + case(stone_num % 4)
        when 0; BoardGeometry::STONE_RADIUS * -1
        when 1; BoardGeometry::STONE_RADIUS * 1
        when 2; BoardGeometry::STONE_RADIUS * -3
        when 3; BoardGeometry::STONE_RADIUS * 3
      end
      stone_y = y_center(pot) + case(stone_num)
        when (0..3);   BoardGeometry::STONE_RADIUS *  1
        when (4..7);   BoardGeometry::STONE_RADIUS * -1
        when (8..11);  BoardGeometry::STONE_RADIUS *  3
        when (12..15); BoardGeometry::STONE_RADIUS * -3
        when (16..19); BoardGeometry::STONE_RADIUS *  5
        when (20..23); BoardGeometry::STONE_RADIUS * -5
        when (24..27); BoardGeometry::STONE_RADIUS *  7
        when (28..31); BoardGeometry::STONE_RADIUS * -7
        when (32..35); BoardGeometry::STONE_RADIUS *  9
        when (36..39); BoardGeometry::STONE_RADIUS * -9
      end
      @stone_image.draw(stone_x, stone_y, ZOrder::Stone)
    end

  end
end
