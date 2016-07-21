module Rules
  class GameInitRule < Rules::Rule
    include ::Helpers::Constants

    def initialize(params = {})
      params[:klass] = Game

      super(params)
    end

    def do_work!
      klass.new(name: 'game_{counter}', status: true)
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} InitGame/)
    end

    private

    def counter
      Database.find.first.select { |a| a.is_a? @klass }.count
    end
  end
end
