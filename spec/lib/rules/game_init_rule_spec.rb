module Rules
  describe GameInitRule do
    it_behaves_like 'a ruler'

    let!(:rule) { described_class.new(line: '') }

    let(:valid_line_1) { ' 20:37 InitGame: \sv_floodProtect\1\s' }
    let(:valid_line_2) { '9195:16 InitGame: 2 3 7: Isgal killET' }

    let(:invalid_line_1) { '2 20:59 InitGame: 2 weapon_rocketla' }
    let(:invalid_line_2) { '-----------------------------------' }

    # then here I will check the line.

    describe '#is_usable_line?' do
      context 'to be invalid game initializing' do
        it "hasn't init word" do
          rule.line = invalid_line_1
          expect(rule.is_usable_line?).to be_falsey

          rule.line = invalid_line_2
          expect(rule.is_usable_line?).to be_falsey
        end
      end

      context 'to be a valid game initializing' do
        it 'has init word' do
          rule.line = valid_line_1
          expect(rule.is_usable_line?).to be_truthy

          rule.line = valid_line_2
          expect(rule.is_usable_line?).to be_truthy
        end
      end
    end

    describe '#do_work!' do
      it 'generate a new Game object' do
        rule.line = valid_line_1
        result = rule.do_work!

        expect(result).to be_a(Game)
        expect(result.name).to eq('game_4')
        expect(result.status).to be_truthy
      end

      # when a game has not finalized...
    end
  end
end
