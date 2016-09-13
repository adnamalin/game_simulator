require_relative 'weapon'

class Sword < Weapon

  STANDARD_APS = 1.4
  DEFAULT_MIN_DMG = 0
  DEFAULT_MAX_DMG = 0
  DEFAULT_STR_MODIFIER = 0

  def initialize(args = {})
    super
  end

end
