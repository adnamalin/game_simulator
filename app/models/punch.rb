require_relative 'attack'

class Punch < Attack

  APS_PERCENTAGE = 1
  DMG_PERCENTAGE = 1
  ELEMENT_TYPE = :physical

  def initialize
    super
  end

end
