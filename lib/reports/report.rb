module Reports
  class Report
    # Will use the template method pattern to be used for other classes
    # like a GameReporter.
    def initialize
      @players = Player.all
    end

    def show
      Game.all.select { |g| !g['status'] }.each do |game|
        puts do_show!(game)
      end
    end

    ##
    # Each class will implement the logic to this method.
    def do_show!(_game); end
  end
end
