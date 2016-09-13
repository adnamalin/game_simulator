require_relative 'attack'

class Cleave < Attack

  APS_PERCENTAGE = 0.90
  DMG_PERCENTAGE = 1.2
  ELEMENT_TYPE = :cold

  def initialize
    super
  end

end
