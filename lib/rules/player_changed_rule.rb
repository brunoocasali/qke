require_relative 'rules'

module Rules
  class PlayerChangedRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Player

      super(params)
    end

    def do_work!
      game = last_open_game

      unless game.nil?
        data = line_data
        player = Player.all.find { |p| p['log_id'] == data[2] }

        player = if player.nil?
                    klass.create(log_id: data[2], name: data[3])
                 else
                    klass.update(player['id'], name: data[3])
                 end

        Game.update(game['id'], players: player)
      end
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} ClientUserinfoChanged/)
    end

    private

    def last_open_game
      Game.all.reverse.find { |item| item['status'] }
    end

    def line_data
      /#{START_MINUTES} ClientUserinfoChanged: #{CHANGED_NAME}/.match(line)
    end
  end
end
