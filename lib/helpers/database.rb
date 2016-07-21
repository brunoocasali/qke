# frozen_string_literal: true
require 'yaml'

module Helpers
  class Database
    # rubocop:disable Style/ClassVars
    @@default_path = 'data/db.yml'

    def self.find(path: @@default_path)
      result = []
      $/ = "\n\n"

      if File.exist?(path)
        File.open(path, 'r').each do |object|
          result << YAML.load(object)
        end
      end

      result
    end
  end
end
