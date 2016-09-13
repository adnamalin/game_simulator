require_relative '../../app/models/lena'
require_relative '../../app/models/axe'
require_relative '../../app/models/punch'
require_relative '../../app/models/cleave'
require_relative '../../app/models/smite'

RSpec.describe AttackCalculator do

  let(:calculator) { AttackCalculator.new() }
  let(:lena) { Lena.new({level: 10}) }
  let(:axe) { Axe.new({min_dmg: 50, max_dmg: 65, element_boost: {type: :fire, percent: 0.10} , str_modifer: 20} )}
  let(:punch) { Punch.new()}
  let(:cleave) { Cleave.new()}
  let(:smite) { Smite.new()}

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
end
