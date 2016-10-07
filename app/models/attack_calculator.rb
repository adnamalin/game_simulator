class AttackCalculator

  class << self

    def all_attack_results(warrior, weapon)
      results =[]
      warrior.attacks.each do |attack|
        results << collect_single_result(warrior, weapon, attack)
      end
      results
    end

    # private

    def collect_single_result(warrior, weapon, attack)
      min = calculate_attack(warrior, weapon, attack, {type: "min"})
      max = calculate_attack(warrior, weapon, attack, {type: "max"})
      dps = damage_per_second({min: min, max: max}, weapon, attack)
      {attack: attack.class.name ,minimum: min, maximum: max, DPS: dps}
    end

    def calculate_attack(warrior, weapon, attack, opts = {})
      original_dmg = opts[:type].downcase == "max" ? weapon.max_dmg : weapon.min_dmg
      base_attack = attack.class::DMG_PERCENTAGE * original_dmg
      strength_multiplier = (warrior.strength + weapon.str_modifer)/100.to_f
      no_boost_total = (base_attack * strength_multiplier) + base_attack
      boost_increase = boost_increase_checker(no_boost_total, weapon, attack)
      final_total = no_boost_total + boost_increase
    end

    def boost_increase_checker(total_damage, weapon, attack)
      weapon.element_type == attack.element_type ? (total_damage * weapon.element_boost_amt) : 0
    end

    def damage_per_second(attack_dmg ={}, weapon, attack)
      average_atk = (attack_dmg[:min] + attack_dmg[:max])/2
      base_aps = average_atk * weapon.class::STANDARD_APS
      (base_aps * attack.class::APS_PERCENTAGE).round(3)
    end

  end
end
