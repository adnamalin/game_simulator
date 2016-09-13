require_relative 'attack'

class Smite < Attack

  APS_PERCENTAGE = 1.2
  DMG_PERCENTAGE = 0.90
  ELEMENT_TYPE = :fire

  def initialize
    super
  end

end
