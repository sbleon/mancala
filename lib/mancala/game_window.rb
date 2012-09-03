require 'gosu'
require 'pry'

module Mancala

  module ZOrder
    Background, Stone = *0..1
  end

  class GameWindow < ::Gosu::Window

    include ::Mancala::BoardGeometry
    include ::Gosu

    def initialize
      @game = Game.new
      @height = 600
      @width = 800
      super(@width, @height, false)
      self.caption = "Mancala"

      @background_image = ::Gosu::Image.new(self, 'images/board_gray.png')
      @stone_image = ::Gosu::Image.new(self, 'images/stone_black.png')
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      elsif id == Gosu::MsLeft
        @game.move(selected_slot) unless selected_slot.nil?
      end
    end

    def selected_slot
      @game.slots.each_with_index do |stone_count, slot_num|
        if distance(mouse_x, mouse_y, x_center(slot_num), y_center(slot_num)) < 45
          return slot_num
        end
      end
      return nil
    end

    def draw
      @background_image.draw(0, 0, ZOrder::Background)
      @game.slots.each_with_index do |slot, slot_num|
        slot.times do |stone_num|
          place_stone(slot_num, stone_num)
        end
      end
    end

    def needs_cursor?
      true
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

    def update
    end

  end
end
