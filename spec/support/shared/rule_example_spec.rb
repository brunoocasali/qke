shared_examples_for 'a ruler' do
  let(:ruler) { described_class.new(klass: Rule) }

  context 'initialized with 3 items' do
    it 'says it has three items' do
      collection.size.should eq(3)
    end
  end

  describe '#include?' do
    context 'with an an item that is in the collection' do
      it 'returns true' do
        collection.include?(7).should be_true
      end
    end

    context 'with an an item that is not in the collection' do
      it 'returns false' do
        collection.include?(9).should be_false
      end
    end
  end
end
