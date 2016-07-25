module Rules
  describe GameEndRule, type: :rule do
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
      it 'change to false last open Game' do
        Game.create(status: true, players: [])

        rule.line = valid_line_1
        rule.do_work!

        expect(Game.all.count { |item| !item['status'] }).to eq(1)
      end

      it 'ignore if has no open games' do
        rule.line = valid_line_1
        rule.do_work!

        expect(Game.all.count).to be_zero
      end
    end
  end
end
