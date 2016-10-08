# frozen_string_literal: true
# require_relative 'rules'
# require_relative 'rule'
require 'pry'

module Rules
  class PlayerChangedRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Player

      super(params)
    end

    def do_work!
      game = Game.last_open

      return if game.nil?
      player = Player.all.find { |p| p['log_id'] == @data[2] }

      game['players'] << update_or_create_from(player)

      Game.update(game['id'], players: game['players'])
    end

    def is_usable_line?
      @data = /#{START_MINUTES} ClientUserinfoChanged: #{CHANGED_NAME}/
              .match(line)
    end

    private

    def update_or_create_from(player)
      result = if player.nil?
                 klass.create(log_id: @data[2], name: @data[3]).last
               else
                 klass.update(player['id'], name: @data[3])
               end

      { 'id' => result['id'], 'log_id' => result['log_id'] }
    end
  end
end
