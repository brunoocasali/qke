module Rules
  class KillRule < Rules::Rule
    include ::Helpers::Constants

    def initialize(params = {})
      params[:klass] = Kill

      super(params)
    end

    def do_work!
      puts 'passou por aqui!'
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} Kill/)
    end
  end
end
