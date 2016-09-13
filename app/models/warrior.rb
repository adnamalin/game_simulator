require_relative 'attack_calculator'

class Warrior

  attr_reader :level, :strength, :vitality, :attacks

  def initialize(args = {})
    @level = args.fetch(:level, 1)
    @strength = args.fetch(:strength, 0)
    @vitality = args.fetch(:vitality,0)
    @attacks = self.class::KNOWN_ATTACKS
    @calculator = AttackCalculator.new
  end

  def attack_results(weapon)
    results =[]
    self.attacks.each do |attack|
      min = @calculator.calculate_attack(self, weapon, attack, {type: "min"})
      max = @calculator.calculate_attack(self, weapon, attack, {type: "max"})
      dps = @calculator.damage_per_second({min: min, max: max}, weapon, attack)
      results << {attack: attack.class.name ,minimum: min, maximum: max, DPS: dps}
    end
    results
  end

  # def total_strength(level)
  #   level * self.class::STRENGTH_INCREASE
  # end
  #
  # def total_vitality(level)
  #   level * self.class::VITALITY_INCREASE
  # end

end
