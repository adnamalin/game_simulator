require_relative 'warrior'
require_relative 'punch'

class Lena < Warrior

  STRENGTH_INCREASE = 10
  VITALITY_INCREASE = 5
  KNOWN_ATTACKS = [Punch.new, Smite.new, Cleave.new]

  def initialize(level)
    super
  end

end
