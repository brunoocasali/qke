module Helpers
  describe Database do
    describe '.find' do
      context 'has file' do
        let!(:path) { 'spec/support/data/data.yml' }

        it 'need to return objects deserialized' do
          result = Database.find(path: path).first

          expect(result.size).to eq(3)

          expect(result.first).to be_a(Game)
          expect(result.first.name).to eq('game_1')
          expect(result.first.status).to be_falsey

          expect(result.last).to be_a(Game)
          expect(result.last.name).to eq('game_3')
          expect(result.last.status).to be_truthy
        end
      end

      context 'has no file' do
        let!(:path) { 'no-file/ops' }

        it 'need to return objects deserialized' do
          result = Database.find(path: path)

          expect(result).to be_empty
        end
      end
    end
  end
end
