require_relative '../../app/models/lena'
require_relative '../../app/models/axe'
require_relative '../../app/models/punch'
require_relative '../../app/models/cleave'
require_relative '../../app/models/smite'

RSpec.describe AttackCalculator do

  let(:calculator) { AttackCalculator }
  let(:lena) { Lena.new({level: 10}) }
  let(:axe) { Axe.new({min_dmg: 50, max_dmg: 65, element_boost_amt: 0.10, element_type: :fire, str_modifer: 20} )}
  let(:punch) { Punch.new()}
  let(:cleave) { Cleave.new()}
  let(:smite) { Smite.new()}

  describe '#calculate_attack for min damage' do

    it 'returns the min attack dmg done punch' do
      expect(calculator.calculate_min_attack(lena, axe, punch)).to eq 60
    end

    it 'returns the min attack dmg done punch' do
      expect(calculator.calculate_min_attack(lena, axe, smite)).to eq 59.4
    end

    it 'returns the min attack dmg done cleave' do
      expect(calculator.calculate_min_attack(lena, axe, cleave)).to eq 72
    end

  end

  describe '#calculate_attack for max damage' do

    it 'returns the max attack dmg done punch' do
      expect(calculator.calculate_max_attack(lena, axe, punch)).to eq 78
    end

    it 'returns the max attack dmg done punch' do
      expect(calculator.calculate_max_attack(lena, axe, smite)).to eq 77.22
    end

    it 'returns the max attack dmg done cleave' do
      expect(calculator.calculate_max_attack(lena, axe, cleave)).to eq 93.6
    end
  end


  describe '#boost_increase_checker' do
    it 'returns the total damage if the attack and weaon match element types' do
      expect(calculator.boost_increase_checker(54, axe, smite)).to eq 59.4
    end

    it 'returns the total damage with no additional boost if they do not match' do
      expect(calculator.boost_increase_checker(60,axe, punch)).to eq 60
    end

  end

  describe '#damage_per_second' do

    it 'returns the dmg per second for punch' do
      expect(calculator.damage_per_second({min: 60, max:78},axe, punch)).to eq 82.8
    end

    it 'returns the dmg per second for smite' do
      expect(calculator.damage_per_second({min: 59.4, max:77.22},axe, smite)).to eq 98.366
    end

    it 'returns the dmg per second for cleave' do
      expect(calculator.damage_per_second({min: 72, max:93.6},axe, cleave)).to eq 89.424
    end

  end

end
