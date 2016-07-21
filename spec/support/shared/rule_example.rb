shared_examples_for 'a ruler' do
  let(:ruler) { described_class.new(klass: Rules::Rule, line: '') }

  context 'respond_to methods' do
    it { expect(ruler).to respond_to(:process!) }
    it { expect(ruler).to respond_to(:is_usable_line?) }
  end

  describe '#process!' do
    it 'get nil' do
      result = ruler.process!

      expect(result).to be_nil
    end
  end

  describe '#is_usable_line?' do
    it 'get nil' do
      result = ruler.process!

      expect(result).to be_nil
    end
  end
end
