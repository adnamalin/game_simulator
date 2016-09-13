require_relative '../../app/models/lena'
require_relative '../../app/models/axe'
require_relative '../../app/models/punch'
require_relative '../../app/models/cleave'
require_relative '../../app/models/smite'

RSpec.describe AttackCalculator do

  let(:calculator) { AttackCalculator.new() }
  let(:lena) { Lena.new({level: 10}) }
  let(:axe) { Axe.new({min_dmg: 50, max_dmg: 65, element_boost: {fire: 0.10} ,str_modifer: 20} )}
  let(:punch) { Punch.new()}
  let(:cleave) { Cleave.new()}
  let(:smite) { Smite.new()}

  describe '#min_attack_dmg' do
    it 'returns the min attack dmg done cleave' do
      expect(calculator.min_attack_dmg(lena, axe, cleave)).to eq 72
    end

    it 'returns the min attack dmg done punch' do
      expect(calculator.min_attack_dmg(lena, axe, punch)).to eq 60
    end

  end

  describe '#boost_increase_checker' do
    it 'returns the boost increase as a integer to be added if the weapon and attack types match' do
      expect(calculator.boost_increase_checker(axe, smite)).to eq 72
    end

    it 'returns 0 if they do not match' do
      expect(calculator.boost_increase_checker(axe, punch)).to eq 60
    end

  end
end
