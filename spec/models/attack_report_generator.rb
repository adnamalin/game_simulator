require_relative '../../app/models/lena'
require_relative '../../app/models/axe'
require_relative '../../app/models/punch'
require_relative '../../app/models/cleave'
require_relative '../../app/models/smite'
require_relative '../../app/models/attack_report_generator'

RSpec.describe AttackReportGenerator do

  let(:generator) { AttackReportGenerator }
  let(:lena) { Lena.new({level: 10}) }
  let(:axe) { Axe.new({min_dmg: 50, max_dmg: 65, element_boost_amt: 0.10, element_type: :fire, str_modifer: 20} )}
  let(:punch) { Punch.new()}
  let(:cleave) { Cleave.new()}
  let(:smite) { Smite.new()}

  describe '#all_attack_results' do

    it 'returns array of hash of attack results for all weapons' do
      expect(generator.all_attack_results(lena, axe)).to eq [{attack: "Punch", minimum: 60, maximum: 78, DPS: 82.8}, {attack: "Smite", minimum: 59.4, maximum: 77.22, DPS: 98.366}, {attack: "Cleave", minimum: 72, maximum: 93.6, DPS: 89.424}]
    end

  end

end
