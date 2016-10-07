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

  describe '#all_attack_results' do

    it 'returns array of hash of attack results fr all weapons' do
      expect(calculator.all_attack_results(lena, axe)).to eq [{attack: "Punch", minimum: 60, maximum: 78, DPS: 82.8}, {attack: "Smite", minimum: 59.4, maximum: 77.22, DPS: 98.366}, {attack: "Cleave", minimum: 72, maximum: 93.6, DPS: 89.424}]
    end

  end

  describe '#calculate_attack for min damage' do

    it 'returns the min attack dmg done punch' do
      expect(calculator.calculate_attack(lena, axe, punch, {type: "min"})).to eq 60
    end

    it 'returns the min attack dmg done punch' do
      expect(calculator.calculate_attack(lena, axe, smite, {type: "min"})).to eq 59.4
    end

    it 'returns the min attack dmg done cleave' do
      expect(calculator.calculate_attack(lena, axe, cleave, {type: "min"})).to eq 72
    end

  end

  describe '#calculate_attack for max damage' do

    it 'returns the max attack dmg done punch' do
      expect(calculator.calculate_attack(lena, axe, punch, {type: "max"})).to eq 78
    end

    it 'returns the max attack dmg done punch' do
      expect(calculator.calculate_attack(lena, axe, smite, {type: "max"})).to eq 77.22
    end

    it 'returns the max attack dmg done cleave' do
      expect(calculator.calculate_attack(lena, axe, cleave, {type: "max"})).to eq 93.6
    end
  end


  describe '#boost_increase_checker' do
    it 'returns the boost increase as a integer to be added if the weapon and attack types match' do
      expect(calculator.boost_increase_checker(54, axe, smite)).to eq 5.4
    end

    it 'returns 0 if they do not match' do
      expect(calculator.boost_increase_checker(60,axe, punch)).to eq 0
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
