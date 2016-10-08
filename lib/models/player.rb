# frozen_string_literal: true
class Player
  include Yamlet.model

  attr_accessor :log_id, :name
end
