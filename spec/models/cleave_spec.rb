require_relative '../../app/models/cleave'

RSpec.describe Cleave do

  let(:cleave) { Cleave.new()}

  describe 'attributes' do
    it 'has aps attack percentage as decimal' do
      expect(cleave.aps_percentage).to eq 0.90
    end

    it 'has dmg attack percentage as decimal' do
      expect(cleave.dmg_percentage).to eq 1.2
    end

    it 'has element type' do
      expect(cleave.element_type).to eq :cold
    end

  end
end
