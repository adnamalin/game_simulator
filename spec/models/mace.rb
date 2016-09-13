require_relative '../../app/models/mace'

RSpec.describe Mace do

  let(:mace) { Mace.new({}) }

  describe 'attributes' do
    it 'has min damage' do
      expect(mace.min_dmg).to eq 50
    end

    it 'has max damage' do
      expect(mace.max_dmg).to eq 65
    end

    it 'has APS' do
      expect(mace.aps).to eq 1
    end

    it 'has elemental boost' do
      expect(mace.element_boost).to eq {fire: 0.1}
    end

    it 'has strength modifer' do
      expect(mace.str_modifer).to eq 20
    end

  end
end

# 50-65 DMG, 20 STR, 10% Fire Damage
# There are three main types of weapons: maces, axes, and swords. These weapons all start with a
# base damage range (DMG) as well as the rate at which they attack, known as attacks per second
# (APS). Maces are slow weapons at 1 APS which have a higher base damage range. Axes perform
# attacks 20% faster than maces but only have average damage. Swords are the fastest weapons
# at 40% faster than maces, but have the lowest base damage range.
# All weapons have a modifier to Lena’s primary attribute (STR). This stat is added to the her base
# primary attribute and the sum of both numbers is used to increase the base attack strength.
# Weapons can optionally provide a boost to elemental damage (Element). The boost is a
# percentage between 5-15% and is a multiplier of total damage for a single attack. The effect is
# only applied if the element of the attack matches that of the weapon’s modifier. The weapon will
# specify which element is boosted as well as the amount. Only 1 elemental modifier is allowed
# per weapon.
