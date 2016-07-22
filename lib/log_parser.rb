%w(helpers models rules).each do |file|
  require File.expand_path("lib/#{file}/#{file}.rb")
end

class LogParser
  def initialize(rules: [Rules::GameInitRule, Rules::GameEndRule,
                         Rules::KillRule])
    @rules = rules
  end

  def run!
    data = Helpers::DataRepository.new
    data.read

    data.text_data.each do |line|
      @rules.each do |rule|
        rule.new(line: line).process!
      end
    end
  end
end
