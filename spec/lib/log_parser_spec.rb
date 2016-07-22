describe LogParser do
  # - check a call using passed rules

  before do
    class FakeRuler < Rules::Rule; end
    class SpyRuler; end
  end

  describe '#run!' do

  end

  describe '#initialize' do
    context 'when invalid' do
      it 'need to raise an exception' do
        message = 'There are invalid :rules inside passed array,' \
                  ' please use only Rules::Rule subclasses.'

        expect do
          described_class.new rules: [SpyRuler]
        end.to raise_error(message)
      end
    end

    context 'when valid' do
      it 'need to return true' do
        expect do
          described_class.new rules: [FakeRuler]
        end.to_not raise_error
      end
    end
  end
end
