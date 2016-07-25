module Rules
  describe KillRule, type: :rule do
    it_behaves_like 'a ruler'

    let!(:rule) { described_class.new(line: '') }

    let(:valid_line_1) { ' 0:42 Kill: 102 2 22: <world> killed pp by MOD_' }
    let(:valid_line_2) { ' 22:06 Kill: 2 3 7: Isgal killed Moc by MOD_ROCKET' }
    let(:valid_line_3) { '999:06 Kill: 2 3 7: Isgal killed Moc by MOD_ROCKET' }
    let(:valid_line_4) { '9999:06 Kill: 2 3 7: Isgal killed Moc by MOD_ROCKET' }

    let(:invalid_line_1) { ' 20:59 Item: 2 weapon_rocketlauncher' }
    let(:invalid_line_2) { ' 21:15 ClientConnect: 2' }
    let(:invalid_line_3) { ' 21:85 Kill: 2' }

    context 'to be invalid kill' do
      describe '#is_usable_line?' do
        it "hasn't kill word" do
          rule.line = invalid_line_1
          expect(rule.is_usable_line?).to be_falsey

          rule.line = invalid_line_2
          expect(rule.is_usable_line?).to be_falsey

          rule.line = invalid_line_3
          expect(rule.is_usable_line?).to be_falsey
        end
      end
    end

    context 'to be a world kill' do
    end

    context 'to be a valid kill' do
      describe '#is_usable_line?' do
        it 'has kill word' do
          rule.line = valid_line_1
          expect(rule.is_usable_line?).to be_truthy

          rule.line = valid_line_2
          expect(rule.is_usable_line?).to be_truthy

          rule.line = valid_line_3
          expect(rule.is_usable_line?).to be_truthy

          rule.line = valid_line_4
          expect(rule.is_usable_line?).to be_truthy
        end
      end

      #  21:42 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT
      #  22:06 Kill: 2 3 7: Isgalamido killed Mocinha by MOD_ROCKET_SPLASH
    end
  end
end
