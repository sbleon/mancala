module Mancala::BoardGeometry
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