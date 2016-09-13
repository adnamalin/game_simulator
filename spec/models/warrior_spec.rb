require_relative '../../app/models/lena'
require_relative '../../app/models/axe'
require_relative '../../app/models/punch'
require_relative '../../app/models/cleave'

RSpec.describe Warrior do

  let(:lena) { Lena.new({level: 10}) }
  let(:axe) { Axe.new({min_dmg: 50, max_dmg: 65, element_boost: {type: :fire, percent: 0.10} ,str_modifer: 20} )}
  let(:punch) { Punch.new()}
  let(:cleave) { Cleave.new()}

  describe '#attack_results' do
    it 'returns array with hashed of attack results' do
      expect(lena.attack_results(axe)).to eq [{attack: "Punch", minimum: 60, maximum: 78, DPS: 82.8}, {attack: "Smite", minimum: 59.4, maximum: 77.22, DPS: 98.366}, {attack: "Cleave", minimum: 72, maximum: 93.6, DPS: 89.424}]
    end

  end
end
