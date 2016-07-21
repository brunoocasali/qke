require 'yaml'

# frozen_string_literal: true
module Helpers
  class DataRepository
    ROOT_PATH = 'data/data.log'.freeze

    attr_accessor :path, :text_data

    def initialize(path: ROOT_PATH)
      @path = path
      @text_data = []
    end

    def read
      if has_file?
        File.open(@path, 'r').each do |line|
          @text_data << line
        end
      end
    end

    def has_file?
      File.extname(@path) == '.log' if File.exist?(@path)
    end

    def has_data_directory?
      Dir.exist? File.dirname(@path)
    end
  end
end
