module Reports
  class Report
    # Will use the template method pattern to be used for other classes
    # like a GameReporter.
    def initialize
      @players = Player.all
    end

    def show
      Game.all.select { |g| !g['status'] }.each do |game|
        p format_one(game)
      end
    end

    def format_one(game)
      {
        game['name'] => {
          total_kills: game['kills'].count,
          players: players_as_array(game['players']),
          kills: kills_as_array(game['kills'])
        }
      }
    end

    def players_as_array(players)
      result = []

      players.map { |e| e['log_id'] }.each do |m|
        result << @players.select { |e| e['log_id'] == m }.map { |a| a['name'] }
      end

      result.flatten!
    end

    def kills_as_array(kills)
      result = {}

      kills.each do |kill|
        key = @players.select { |e| e['log_id'] == kill['killer'] }.first

        result[key['name']] = average_kill(key['log_id'], kills) unless key.nil?
      end

      result
    end

    def average_kill(player_id, kills)
      kills.select { |e| e['killer'] == player_id }.count -
      kills.select { |e| e['killed'] == player_id && e['killer'] == '1022' }.count
    end
  end
end
