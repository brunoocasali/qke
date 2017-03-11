# frozen_string_literal: true
describe Game do
  describe '.last_open' do
    let!(:game_1) { Game.create(status: true, name: 'game_1')[0] }
    let!(:game_2) { Game.create(status: false, name: 'game_2')[0] }

    it 'need to return the only opened' do
      result = described_class.last_open

      expect(result).to eq(game_1)
      expect(result['name']).to eq('game_1')
    end
  end
end
