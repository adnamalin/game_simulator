require_relative '../../app/models/mace'

RSpec.describe Mace do

  let(:mace) { Mace.new({level: 10}) }

  describe 'attributes' do
    it 'has a level' do
      expect(mace.level).to eq 10
    end

    it 'has vitality as integer' do
      expect(mace.vitality).to eq 50
    end

    it 'has strength as integer' do
      expect(mace.strength).to eq 100
    end

  end
end
