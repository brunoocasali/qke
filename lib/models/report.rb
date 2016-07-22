class Report
  # Will use the template method pattern to be used for other classes
  # like a GameReporter.
  def show
    Game.all.select { |g| !g['status'] }.each do |game|
      puts format_one(game)
    end
  end

  def players_as_array(game)
    result = []

    game['players'].each do |item|
      found = Player.all.find { |player| player['log_id'] == item['log_id'] }

      result << found['name'] unless found.nil?
    end

    result
  end

  def format_one(game)
    {
      game['name'] => {
        # 'total_kills' => 45,
        'players' => players_as_array(game),
        # 'kills' => game['kills']
      }
    }
  end
end
