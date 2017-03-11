# frozen_string_literal: true
shared_examples_for 'a ruler' do
  let(:ruler) { described_class.new(klass: Rules::Rule, line: '') }

  context 'respond_to methods' do
    it { expect(ruler).to respond_to(:process!) }
    it { expect(ruler).to respond_to(:is_usable_line?) }
    it { expect(ruler).to respond_to(:do_work!) }
  end

  describe '#process!' do
    it 'get nil' do
      result = ruler.process!

      expect(result).to be_nil
    end
  end

  describe '#is_usable_line?' do
    it 'get nil' do
      result = ruler.is_usable_line?

      expect(result).to be_falsey
    end
  end

  describe '#is_usable_line?' do
    it 'get nil' do
      expect(ruler).to receive(:is_usable_line?).and_return(false)

      result = ruler.is_usable_line?
      expect(result).to be_falsey
    end
  end

  describe '#do_work!' do
    it 'get nil' do
      expect(ruler).to receive(:is_usable_line?).and_return(true)
      expect(ruler).to receive(:do_work!)

      ruler.process!
    end
  end
end
