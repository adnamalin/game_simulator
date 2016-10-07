class Weapon
  attr_reader :min_dmg, :max_dmg, :element_type, :element_boost_amt, :str_modifer, :aps

  def initialize(args = {})
    @min_dmg = args.fetch(:min_dmg, self.class::DEFAULT_MIN_DMG)
    @max_dmg = args.fetch(:max_dmg, self.class::DEFAULT_MAX_DMG)
    @element_type = args.fetch(:element_type, 'none')
    @element_boost_amt = args.fetch(:element_boost_amt, 0)
    @str_modifer = args.fetch(:str_modifer, self.class::DEFAULT_STR_MODIFIER)
    @aps = self.class::STANDARD_APS
  end

end
