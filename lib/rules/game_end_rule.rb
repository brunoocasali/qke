module Rules
  class GameEndRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Game

      super(params)
    end

    def do_work!
      last_open_game
      # get the last open game, then change to status: false

      # klass.new(name: "game_#{counter}", status: true)

      # certiicar-se no teste que os dados antigos continuam lá.
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} ShutdownGame/)
    end

    private

    def last_open_game
      @current = Helpers::Database.find.first

      @current.reverse.find { |item| item.is_a?(@klass) && item.status }
    end
  end
end
