class Game
  include Yamlet.model

  attr_accessor :name, :status, :kills, :players

  # A game class need to be responsible about (attrs):
  #   :status  => Initiated or not Initiated
  #   :name    => Your code like: game-1, game-2, game-n.
  #   :kills   => Array of Kill.
  #   :players => Array of Player.

  # Using methods will give these awnsers (methods):
  #   :total_kills => count of kills.
  #   :players     => simple getter method.
  #   :kills       => simple getter method.
end
