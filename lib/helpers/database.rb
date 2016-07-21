# frozen_string_literal: true
require 'yaml'

module Helpers
  class Database
    ROOT_PATH = 'data/db.yml'.freeze

    def self.find(path: ROOT_PATH)
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
