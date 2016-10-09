require_relative 'warrior'
require_relative 'punch'
require_relative 'smite'
require_relative 'cleave'

class Conan < Warrior

  STRENGTH_INCREASE = 20
  VITALITY_INCREASE = 5
  KNOWN_ATTACKS = [Punch.new, Smite.new, Cleave.new]

  def initialize(level)
    super
  end

end
