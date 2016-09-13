class Weapon
  attr_reader :min_dmg, :max_dmg, :element_boost, :str_modifer, :aps

  def initialize(args = {})
    @min_dmg = args.fetch(:min_dmg, self.class::DEFAULT_MIN_DMG)
    @max_dmg = args.fetch(:max_dmg, self.class::DEFAULT_MAX_DMG)
    @element_boost = args.fetch(:element_boost, nil)
    @str_modifer = args.fetch(:str_modifer, self.class::DEFAULT_STR_MODIFIER)
    @aps = self.class::STANDARD_APS
  end
end
