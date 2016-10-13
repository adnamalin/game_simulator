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

    private

    def collect_single_result(warrior, weapon, attack)
      AttackCalculator.calculate_all(warrior, weapon, attack)
    end

  end

end
