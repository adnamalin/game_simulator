require_relative 'attack_calculator'

class Warrior

  attr_reader :level, :strength, :vitality, :attacks

  def initialize(args = {})
    @level = args.fetch(:level, 1)
    @strength = args.fetch(:strength, 0)
    @vitality = args.fetch(:vitality,0)
    @attacks = self.class::KNOWN_ATTACKS
  end

end
