class AttackCalculator

  def calculate_attack(warrior, weapon, attack, opts = {})
    original_dmg = opts[:type].downcase == "max" ? weapon.max_dmg : weapon.min_dmg
    base_attack = attack.class::DMG_PERCENTAGE * original_dmg
    strength_multiplier = (warrior.strength + weapon.str_modifer)/100.to_f
    no_boost_total = (base_attack * strength_multiplier) + base_attack
    boost_increase = boost_increase_checker(no_boost_total, weapon, attack)
    final_total = no_boost_total + boost_increase
    final_total
  end

  def boost_increase_checker(total_damage,weapon, attack)
    weapon.element_boost[:type] == attack.element_type ? (total_damage * weapon.element_boost[:percent]) : 0
  end

  def damage_per_second(attack_dmg ={}, weapon, attack)
    average_atk = (attack_dmg[:min] + attack_dmg[:max])/2
    base_aps = average_atk * weapon.class::STANDARD_APS
    (base_aps * attack.class::APS_PERCENTAGE).round(3)
  end

end
