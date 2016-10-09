require_relative '../../app/models/axe'

RSpec.describe Axe do

  let(:axe) { Axe.new({min_dmg: 50, max_dmg: 65, element_boost_amt: 0.10, element_type: :fire, str_modifer: 20} )}

  describe 'attributes' do
    it 'has min damage' do
      expect(axe.min_dmg).to eq 50
    end

    it 'has max damage' do
      expect(axe.max_dmg).to eq 65
    end

    it 'has APS' do
      expect(axe.aps).to eq 1.2
    end

    it 'has elemental type' do
      expect(axe.element_type).to eq(:fire)
    end

    it 'has elemental boost amount' do
      expect(axe.element_boost_amt).to eq(0.10)
    end

    it 'has strength modifer' do
      expect(axe.str_modifer).to eq 20
    end

  end
end
