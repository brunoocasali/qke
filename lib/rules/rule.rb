module Rules
  class Rule
    # this class will turn a "base" class to template methods.
    attr_reader :klass, :actual_line

    def initialize(klass:, line:)
      @klass = klass
      @actual_line = line
    end

    def process!; end

    ##
    # Public: This method will be used to check if actual line has a "piece"
    #         of real covered line like:
    # KillRule will only match lines with "Kill:"
    # GameRule will only match lines with "InitGame:"
    #
    # Returns a bool value.
    def is_usable_line?
    end
  end
end
