class AttackCalculator

  class << self

    # private

    def calculate_max_attack(warrior, weapon, attack)
      base_attack = attack.class::DMG_PERCENTAGE * weapon.max_dmg
      calculate_attack(warrior, weapon,attack, base_attack)
    end

    def calculate_min_attack(warrior, weapon, attack)
      base_attack = attack.class::DMG_PERCENTAGE * weapon.min_dmg
      calculate_attack(warrior, weapon, attack, base_attack)
    end

    def calculate_attack(warrior, weapon, attack, base_attack)
      no_boost_total = no_boost_total_calculator(warrior, weapon, base_attack)
      final_total = boost_increase_checker(no_boost_total, weapon, attack)
    end

    def no_boost_total_calculator(warrior, weapon, base_attack)
      strength_multiplier = strength_multiplier_calculation(warrior, weapon)
      (base_attack * strength_multiplier) + base_attack
    end

    def strength_multiplier_calculation(warrior, weapon)
      (warrior.strength + weapon.str_modifer)/100.to_f
    end

    def boost_increase_checker(no_boost_total, weapon, attack)
      if boost_increase_qualified?(weapon, attack)
        boost_increase_adder(no_boost_total, weapon)
      else
        no_boost_total
      end
    end

    def boost_increase_qualified?(weapon, attack)
      weapon.element_type == attack.element_type
    end

    def boost_increase_adder(no_boost_total, weapon)
      no_boost_total + (no_boost_total * weapon.element_boost_amt)
    end

    def damage_per_second(attack_dmg ={}, weapon, attack)
      average_atk = (attack_dmg[:min] + attack_dmg[:max])/2
      base_aps = average_atk * weapon.class::STANDARD_APS
      (base_aps * attack.class::APS_PERCENTAGE).round(3)
    end

  end
end
