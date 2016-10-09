require_relative 'attack_calculator'

class AttackReportGenerator

  class << self

    def all_attack_results(warrior, weapon)
      results =[]
      warrior.attacks.each do |attack|
        results << collect_single_result(warrior, weapon, attack)
      end
      results
    end

    def collect_single_result(warrior, weapon, attack)
      min = AttackCalculator.calculate_min_attack(warrior, weapon, attack)
      max = AttackCalculator.calculate_max_attack(warrior, weapon, attack)
      dps = AttackCalculator.damage_per_second({min: min, max: max}, weapon, attack)
      {attack: attack.class.name ,minimum: min, maximum: max, DPS: dps}
    end

  end

end