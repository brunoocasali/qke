# frozen_string_literal: true
module Rules
  describe Rule, type: :rule do
    let!(:rule) { Rule.new(klass: Rule, line: '') }

    describe '#initialize' do
      it 'need to return the klass passed by param' do
        expect(rule.klass).to eq(Rule)
      end
    end

    describe '#process!' do
      it 'respond to method' do
        expect(rule).to respond_to(:process!)
      end
    end

    describe '#is_usable_line?' do
      it 'respond to method' do
        expect(rule).to respond_to(:is_usable_line?)
      end
    end
  end
end
