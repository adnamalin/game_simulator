class AttackCalculator

  def min_attack_dmg(warrior, weapon, attack)
    base_attack = attack.class::DMG_PERCENTAGE * weapon.min_dmg
    strength_multiplier = (warrior.strength + weapon.str_modifer)/100.to_f
    no_boost_total = (base_attack * strength_multiplier) + base_attack
    boost_increase = boost_increase_checker(no_boost_total, weapon, attack)
    final_total = no_boost_total + boost_increase
  end

  def max_attack_dmg(warrior, weapon, attack)
    base_attack = attack.class::DMG_PERCENTAGE * weapon.max_dmg
    strength_multiplier = (warrior.strength + weapon.str_modifer)/100.to_f
    no_boost_total = (base_attack * strength_multiplier) + base_attack
    boost_increase = boost_increase_checker(no_boost_total, weapon, attack)
    final_total = no_boost_total + boost_increase
  end

  def boost_increase_checker(total_damage,weapon, attack)
    weapon.element_boost[:type] == attack.element_type ? (total_damage * weapon.element_boost[:percent]) : 0
  end

end



# APS_PERCENTAGE * Mace::STANDARD_APS
# BASE ATTACK = DMG_PERCENTAGE * Mace.min_dmg
# attack_multiplier = (Lena.strength + Mace.str_modifer)/100
# attack = (Base attack * attack_multiplier) + base attack
# boost_increase = (attack * boost_percentage)
# final_total = attack _ boost_increase

# base attack = 50
# attack_multiplier = (100 + 20)/100
# boost_increase = 5 - no boost
# attack = (50 * 1.2) + 50
