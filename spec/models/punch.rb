require_relative '../../app/models/punch'

RSpec.describe Punch do

  let(:punch) { Punch.new()}

  describe 'attributes' do
    it 'has aps attack percentage as decimal' do
      expect(punch.aps_percentage).to eq 1
    end

    it 'has dmg attack percentage as decimal' do
      expect(punch.dmg_percentage).to eq 1
    end

    it 'has element type' do
      expect(punch.element_type).to eq :physical
    end


  end
end

# Attacks at 100% of weapon’s APS for 100% of the weapon’s DMG as Physical.
