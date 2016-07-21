# frozen_string_literal: true
class DataRepository
  ROOT_PATH = 'data/data.log'.freeze

  attr_accessor :path, :text_data

  def initialize(path = ROOT_PATH)
    @path = path
    @text_data = []
  end

  def read
    if file?
      File.open(@path, 'r').each do |line|
        @text_data << line
      end
    end
  end

  def file?
    File.extname(@path) == '.log' if File.exist?(@path)
  end

  def data_directory?
    File.dirname(@path) == 'data'
  end
end
