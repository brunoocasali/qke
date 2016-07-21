class Kill
  include Yamlet.model

  attr_accessor :killer, :killed
  # A kill has some problems!
  # The log file has many kinds of lines, this class will be used to save
  # only the real kills discovered from game log.
end
