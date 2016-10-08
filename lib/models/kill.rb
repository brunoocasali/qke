# frozen_string_literal: true
class Kill
  include Yamlet.model

  attr_accessor :killer, :killed, :cause
end
