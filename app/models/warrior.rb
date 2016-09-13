require_relative 'attack_calculator'

class Warrior

  include AttackCalculator
  
  attr_reader :level, :strength, :vitality, :attacks

  def initialize(args = {})
    @level = args.fetch(:level, 1)
    @strength = args.fetch(:strength, 0)
    @vitality = args.fetch(:vitality,0)
    @attacks = self.class::KNOWN_ATTACKS
  end

  def attack_results
  end

  # def total_strength(level)
  #   level * self.class::STRENGTH_INCREASE
  # end
  #
  # def total_vitality(level)
  #   level * self.class::VITALITY_INCREASE
  # end

end
