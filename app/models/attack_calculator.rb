class AttackCalculator
    class << self

      def calculate_all(args={})
        warrior = args[:warrior]
        weapon = args[:weapon]
        attack = args[:attack]
        min = calculate_min_attack(warrior, weapon, attack)
        max = calculate_max_attack(warrior, weapon, attack)
        dps = damage_per_second(min, max, weapon, attack)
        {attack: attack.class.name ,minimum: min, maximum: max, DPS: dps}
      end

      private

      def calculate_max_attack(warrior, weapon, attack)
        base_attack = attack_dmg_percentage(attack) * weapon.max_dmg
        calculate_attack(warrior, weapon,attack, base_attack)
      end

      def calculate_min_attack(warrior, weapon, attack)
        base_attack = attack_dmg_percentage(attack) * weapon.min_dmg
        calculate_attack(warrior, weapon, attack, base_attack)
      end

      def calculate_attack(warrior, weapon, attack, base_attack)
        no_boost_total = no_boost_total_calculator(warrior, weapon, base_attack)
        boost_increase_checker(no_boost_total, weapon, attack)
      end

      def no_boost_total_calculator(warrior, weapon, base_attack)
        strength_multiplier = strength_multiplier_calculator(warrior, weapon)
        (base_attack * strength_multiplier) + base_attack
      end

      def strength_multiplier_calculator(warrior, weapon)
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

      def damage_per_second(min_atk, max_atk, weapon, attack)
        base_aps = average_atk(min_atk, max_atk) * weapon.aps
        (base_aps * attack.aps_percentage).round(3)
      end

      def average_atk(min_atk, max_atk)
        (min_atk + max_atk)/2
      end

      def attack_dmg_percentage(attack)
        attack.dmg_percentage
      end
    end
end
