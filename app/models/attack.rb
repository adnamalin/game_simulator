class Attack

  attr_reader :aps_percentage, :dmg_percentage, :element_type

  def initialize
    @aps_percentage = self.class::APS_PERCENTAGE
    @dmg_percentage = self.class::DMG_PERCENTAGE
    @element_type = self.class::ELEMENT_TYPE
  end

end
