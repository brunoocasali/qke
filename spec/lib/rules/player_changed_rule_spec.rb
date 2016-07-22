module Rules
  describe PlayerChangedRule, type: :rule do
    it_behaves_like 'a ruler'

    let!(:rule) { described_class.new(line: '') }

    let!(:valid_line_1) { ' 21:15 ClientUserinfoChanged: 2 n\Isgalamido\t\0\m' }
    let!(:valid_line_2) { ' 22:13 ClientUserinfoChanged: 2 n\Moda  Foca\t\0\m' }

    let!(:invalid_line_1) { ' 20:59 ClienstUserinfoChanged: 2 nmyname\t' }
    let!(:invalid_line_2) { ' 22:36 ClientUserinfoasdChanged: 7 n\myname\s' }

    describe '#is_usable_line?' do
      context 'to be invalid player info' do
        it "hasn't init word" do
          rule.line = invalid_line_1
          expect(rule.is_usable_line?).to be_falsey

          rule.line = invalid_line_2
          expect(rule.is_usable_line?).to be_falsey
        end
      end

      context 'to be a valid player info' do
        it 'has init word' do
          rule.line = valid_line_1
          expect(rule.is_usable_line?).to be_truthy

          rule.line = valid_line_2
          expect(rule.is_usable_line?).to be_truthy
        end
      end
    end

    describe '#do_work!' do
      before { Game.create(status: true) }

      it 'validate player values' do
        rule.line = valid_line_1
        rule.do_work!

        player = Player.all.last

        expect(player['name']).to eq('Isgalamido')
        expect(player['log_id']).to eq('2')
      end

      it 'if player do not exists then create' do
        expect(Player.all.count).to be_zero

        rule.line = valid_line_1
        rule.do_work!

        expect(Player.all.count).to eq(1)
      end

      it 'if player already exists then update' do
        rule.line = valid_line_1
        rule.do_work!

        player = Player.all.last
        expect(Player.all.count).to eq(1)
        expect(player['name']).to eq('Isgalamido')
        expect(player['log_id']).to eq('2')

        rule.line = valid_line_2
        rule.do_work!

        player = Player.all.last
        expect(Player.all.count).to eq(1)
        expect(player['name']).to eq('Moda  Foca')
        expect(player['log_id']).to eq('2')
      end
    end
  end
end
