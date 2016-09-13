class AttackCalculator

  def min_attack_dmg(warrior, weapon, attack)
    base_attack = attack.class::DMG_PERCENTAGE * weapon.min_dmg
    strength_multiplier = (warrior.strength + weapon.str_modifer)/100.to_f
    # boost_increase = (base_attack * weapon.element_boost.first.value)
    final_total = (base_attack * strength_multiplier) + base_attack
    final_total
  end

  def boost_increase_checker(weapon, attack)
  end

end



# APS_PERCENTAGE * Mace::STANDARD_APS
# BASE ATTACK = DMG_PERCENTAGE * Mace.min_dmg
# attack_multiplier = (Lena.strength + Mace.str_modifer)/100
# boost_increase = (base attack * boost_percentage)
# attack = (Base attack * attack_multiplier) + base attack + boost_increase

# base attack = 50
# attack_multiplier = (100 + 20)/100
# boost_increase = 5 - no boost
# attack = (50 * 1.2) + 50
