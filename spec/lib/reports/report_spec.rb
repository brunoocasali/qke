# frozen_string_literal: true
describe Reports::Report do
  let(:report) { Reports::Report.new }

  describe 'initialize' do
    it 'sets up information for all players' do
      expect(report.instance_variables).to include(:@players)
      expect(report.instance_variable_get('@players')).to be_empty
    end
  end

  describe 'show' do
    it 'does dummy processing of games with falsy status' do
      stat = [{ 'status' => nil }]
      allow(Game).to receive_messages(all: stat)
      expect(report.show).to eq(stat)
    end
  end
end
