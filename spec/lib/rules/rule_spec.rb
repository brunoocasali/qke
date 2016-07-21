module Rules
  describe Rule do
    let!(:rule) { Rule.new(klass: Rule) }

    describe '.initialize' do
      it 'need to return the klass passed by param' do
        expect(rule.klass).to eq(Rule)
      end
    end

    describe 'process!' do
      it 'respond to method' do
        expect(rule).to respond_to(:process!)
      end
    end
  end
end
