module Rules
  describe GameEndRule do
    it_behaves_like 'a ruler'

    let!(:rule) { described_class.new(line: '') }

    let(:valid_line_1) { ' 20:37 ShutdownGame:' }
    let(:valid_line_2) { '  1:47 ShutdownGame:' }

    let(:invalid_line_1) { '2 20:59 ShutGame: ' }
    let(:invalid_line_2) { '------------------' }

    describe '#is_usable_line?' do
      context 'to be invalid game ending' do
        it "hasn't init word" do
          rule.line = invalid_line_1
          expect(rule.is_usable_line?).to be_falsey

          rule.line = invalid_line_2
          expect(rule.is_usable_line?).to be_falsey
        end
      end

      context 'to be a valid game ending' do
        it 'has init word' do
          rule.line = valid_line_1
          expect(rule.is_usable_line?).to be_truthy

          rule.line = valid_line_2
          expect(rule.is_usable_line?).to be_truthy
        end
      end
    end

    describe '#do_work!' do
      before { Game.update(3, status: true) }

      it 'change to false last open Game' do
        expect(Game.all.count { |item| !item['status'] }).to eq(2)

        rule.line = valid_line_1
        result = rule.do_work!

        expect(Game.all.count { |item| !item['status'] }).to eq(3)
      end
    end
  end
end
