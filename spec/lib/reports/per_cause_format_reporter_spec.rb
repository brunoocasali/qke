# frozen_string_literal: true
describe Reports::PerCauseFormatReporter do
  let(:pcf_report) { Reports::PerCauseFormatReporter.new }

  describe 'do_show!' do
    it 'returns a hash of the game details' do
      game = {
        'name' => 'World War',
        'kills' => [
          {
            'cause' => 0
          }
        ]
      }
      expect(pcf_report.do_show!(game)).to eq('World War' => {
                                                kills_by_means: {
                                                  'MOD_UNKNOWN' => 1
                                                }
                                              })
    end
  end
end
