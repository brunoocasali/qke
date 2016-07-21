module Rules
  class GameInitRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Game

      super(params)
    end

    def do_work!
      klass.new(name: "game_#{counter}", status: true)
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} InitGame/)
    end

    private

    def counter
      Helpers::Database.find.first.count { |a| a.is_a? @klass } + 1
    end
  end
end
