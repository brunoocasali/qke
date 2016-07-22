module Rules
  class GameEndRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Game

      super(params)
    end

    def do_work!
      game = last_open_game
      klass.update(game['id'], status: false) unless game.nil?
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} ShutdownGame/)
    end

    private

    def last_open_game
      klass.all.reverse.find { |item| item['status'] }
    end
  end
end
