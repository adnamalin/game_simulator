require_relative '../../app/models/mace'

RSpec.describe Mace do

  let(:mace) { Mace.new({min_dmg: 50, max_dmg: 65, element_boost: {type: :fire, percent: 0.10} ,str_modifer: 20} )}

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
      expect(mace.element_boost).to eq({type: :fire, percent: 0.10})
    end

    it 'has strength modifer' do
      expect(mace.str_modifer).to eq 20
    end

  end
end
