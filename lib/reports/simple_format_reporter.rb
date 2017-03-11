# frozen_string_literal: true
# require 'report'

module Reports
  class SimpleFormatReporter < Reports::Report
    def do_show!(game)
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
      player_kills = kills.select { |e| e['killer'] == player_id }
      player_killed = kills.select do |e|
        e['killed'] == player_id && e['killer'] == '1022'
      end
      player_kills.count - player_killed.count
    end
  end
end
