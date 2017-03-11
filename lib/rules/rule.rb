# frozen_string_literal: true
module Rules
  class Rule
    attr_accessor :klass, :line

    def initialize(klass:, line:)
      @klass = klass
      @line = line
      @data ||= []
    end

    ##
    # Public: A method wrapper to check if is a valid line and starts the work.
    #
    # Returns nothing.
    def process!
      return unless is_usable_line?

      do_work!
    end

    ##
    # Public: This method will be used to check if actual line has a "piece"
    #         of real covered line like:
    # KillRule will only match lines with "Kill:"
    # GameRule will only match lines with "InitGame:"
    #
    # Returns a bool value.
    def is_usable_line?; end

    ##
    # Public: This method each algorithm will implement yours.
    #
    # Returns nothing.
    def do_work!; end
  end
end
