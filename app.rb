require 'yamlet'

Yamlet.repository_file = './data/db.yml'

require File.expand_path('lib/log_parser.rb')

# Responsible to parse things inside log.
# parser = LogParser.new
# parser.run!

# Responsible to show things from db.yml.
report = Report.new
report.show
