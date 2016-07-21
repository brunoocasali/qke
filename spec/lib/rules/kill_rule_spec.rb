module Rules
  describe KillRule do
    it_behaves_like 'a ruler'

    # then here I will check the line.

    context 'to be invalid kill' do
    end

    context 'to be a world kill' do
    end

    context 'to be a valid kill' do
      describe '#is_usable_line?' do
        it "hasn't kill word" do
        end

        it "has kill word" do
          expect(true).to be_truthy
        end
      end

      #  21:42 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT
      #  22:06 Kill: 2 3 7: Isgalamido killed Mocinha by MOD_ROCKET_SPLASH
    end
  end
end
