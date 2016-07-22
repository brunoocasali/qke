require 'yamlet'

Yamlet.repository_file = './data/db.yml'

require File.expand_path('lib/log_parser.rb')

parser = LogParser.new
parser.run!
