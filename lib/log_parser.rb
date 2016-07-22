%w(helpers models rules).each do |file|
  require File.expand_path("lib/#{file}/#{file}.rb")
end

class LogParser
  attr_reader :rules, :data

  def initialize(rules: [Rules::GameInitRule, Rules::GameEndRule,
                         Rules::KillRule], data: Helpers::DataRepository.new)
    @rules = rules
    @data = data

    valid_rules?
  end

  def run!
    # TODO: remover isso. apenas para debug
    # Game.destroy_all
    # TODO: remover isso. apenas para debug

    data.read

    data.text_data.each do |line|
      rules.each do |rule|
        rule.new(line: line).process!
      end
    end
  end

  private

  def valid_rules?
    unless rules.all? { |klass| klass <= Rules::Rule }
      fail 'There are invalid :rules inside passed array,' \
                  ' please use only Rules::Rule subclasses.'
    end

    true
  end
end
