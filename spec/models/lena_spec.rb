require_relative '../../app/models/lena'

RSpec.describe Lena do

  let(:lena) { Lena.new({level: 10}) }

  describe 'attributes' do
    it 'has a level' do
      expect(lena.level).to eq 10
    end

    it 'has vitality as integer' do
      expect(lena.vitality).to eq 0
    end

    it 'has strength as integer' do
      expect(lena.strength).to eq 0
    end

    it 'has known attacks' do
      expect(lena.attacks.all? {|a| a.class.superclass == Attack}).to eq true
    end

  end
end
