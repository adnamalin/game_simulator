class Sword

  STANDARD_APS = 1.4

  attr_reader :min_dmg, :max_dmg, :element_boost, :str_modifer, :aps

  def initialize(args = {})
    @min_dmg = args.fetch(:min_dmg, 0)
    @max_dmg = args.fetch(:max_dmg, 0)
    @element_boost = args.fetch(:element_boost, nil)
    @str_modifer = args.fetch(:str_modifer, 0)
    @aps = STANDARD_APS
  end

end
