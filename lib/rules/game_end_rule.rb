module Rules
  class GameEndRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Game

      super(params)
    end

    def do_work!
      game = Game.last_open
      Game.update(game['id'], status: false, players: game['players'].uniq { |a| a['log_id'] }) unless game.nil?
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} ShutdownGame/)
    end
  end
end
