require_relative '../../app/models/sword'

RSpec.describe Sword do

  let(:sword) { Sword.new({min_dmg: 50, max_dmg: 65, element_boost: {type: :fire, percent: 0.10} ,str_modifer: 20} )}

  describe 'attributes' do
    it 'has min damage' do
      expect(sword.min_dmg).to eq 50
    end

    it 'has max damage' do
      expect(sword.max_dmg).to eq 65
    end

    it 'has APS' do
      expect(sword.aps).to eq 1.4
    end

    it 'has elemental boost' do
      expect(sword.element_boost).to eq({type: :fire, percent: 0.10})
    end

    it 'has strength modifer' do
      expect(sword.str_modifer).to eq 20
    end

  end
end
