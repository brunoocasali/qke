module Rules
  class KillRule < Rules::Rule
    include ::Helpers::Constants

    def initialize(params = {})
      params[:klass] = Kill

      super(params)
    end

    def do_work!
      game = Game.last_open

      unless game.nil?
        game['kills'] << { 'killer' => @data[2], 'killed' => @data[3], 'cause' => @data[4] }

        Game.update(game['id'], kills: game['kills'])
      end
    end

    def is_usable_line?
      @data = /#{START_MINUTES} Kill: #{DEATH_NUMBER_SEQUENCE}/.match(line)
    end
  end
end
