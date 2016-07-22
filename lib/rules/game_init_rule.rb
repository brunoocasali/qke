module Rules
  class GameInitRule < Rules::Rule
    include Helpers::Constants

    def initialize(params = {})
      params[:klass] = Game

      super(params)
    end

    def do_work!
      klass.create(name: "game_#{counter}", status: true)
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} InitGame/)
    end

    private

    def counter
      klass.all.count + 1
    end
  end
end
