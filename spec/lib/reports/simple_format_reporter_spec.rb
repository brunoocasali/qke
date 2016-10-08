# frozen_string_literal: true
describe Reports::SimpleFormatReporter do
  let(:sf_report) { Reports::SimpleFormatReporter. new }

  describe 'do_show!' do
    it 'returns a hash of the game details' do
      game = {
        'name' => 'World War',
        'kills' => [
          { 'killer' => '0001' }
        ],
        'players' => [
          { 'log_id' => '0001' }
        ]
      }
      expect(sf_report.do_show!(game)).to eq('World War' => {
                                               total_kills: 1,
                                               players: [],
                                               kills: {}
                                             })
    end
  end
end
