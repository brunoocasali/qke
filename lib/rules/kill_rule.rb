require 'rules/rule'

module Rules
  class KillRule < Rules::Rule
    include ::Helpers::Constants

    def initialize(params)
      super(params)
    end

    def is_usable_line?
      !START_MINUTES.match(date_string).nil?
    end
  end
end
