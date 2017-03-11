# frozen_string_literal: true
require_relative 'pre_load'

class LogParser
  attr_reader :rules, :data

  def initialize(rules: RULES, data: Helpers::DataRepository.new)
    @rules = rules
    @data = data

    valid_rules?
  end

  def run!
    # TODO: remover isso. apenas para debug
    Game.destroy_all
    Player.destroy_all
    Kill.destroy_all
    # TODO: remover isso. apenas para debug

    data.read

    data.text_data.each do |line|
      rules.each do |rule|
        rule.new(line: line).process!
      end
    end
  end

  private

  RULES = [Rules::GameInitRule, Rules::GameEndRule, Rules::KillRule,
           Rules::PlayerChangedRule].freeze

  def valid_rules?
    unless rules.all? { |klass| klass <= Rules::Rule }
      raise 'There are invalid :rules inside passed array,' \
                  ' please use only Rules::Rule subclasses.'
    end

    true
  end
end
