class Warrior

  attr_reader :level, :strength, :vitality, :attacks

  def initialize(args = {})
    @level = args.fetch(:level, 1)
    @strength = args.fetch(:strength, total_strength(@level))
    @vitality = args.fetch(:vitality, total_vitality(@level))
    @attacks = self.class::KNOWN_ATTACKS
  end

  def total_strength(level)
    level * self.class::STRENGTH_INCREASE
  end

  def total_vitality(level)
    level * self.class::VITALITY_INCREASE
  end

end
