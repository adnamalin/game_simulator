require_relative '../../app/models/smite'

RSpec.describe Smite do

  let(:smite) { Smite.new()}

  describe 'attributes' do
    it 'has aps attack percentage as decimal' do
      expect(smite.aps_percentage).to eq 1.2
    end

    it 'has dmg attack percentage as decimal' do
      expect(smite.dmg_percentage).to eq 0.90
    end

    it 'has element type' do
      expect(smite.element_type).to eq :fire
    end

  end
end
