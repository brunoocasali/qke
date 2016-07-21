module Rules
  class Rule
    # this class will turn a "base" class to template methods.
    attr_reader :klass

    def initialize(klass:)
      @klass = klass
    end

    def process!
    end
  end
end
