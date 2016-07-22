module Helpers
  module Constants
    # Used to match the start of lines requiring or not the space
    START_MINUTES = /^\s*?([0-9]*):[0-5][0-9]/
    CHANGED_NAME = /([0-9]*) n\\([a-zA-Z -_0-9]*)\\t\\/
  end
end
