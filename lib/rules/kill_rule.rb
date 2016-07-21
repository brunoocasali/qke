require 'rules/rule'
require 'helpers/constants'

module Rules
  class KillRule < Rules::Rule
    include ::Helpers::Constants

    def initialize(params)
      super params
    end

    def is_usable_line?
      !(line !~ /#{START_MINUTES} Kill/)
    end
  end
end
