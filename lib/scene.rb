class Scene
  attr_reader :board,
              :player,
              :sprites

  def initialize
    @board       = Board.new
    @player      = Player.new
    @heart_meter = HeartMeter.new @player
    @sprites     = [@board, @player, @heart_meter]

    move_player player.y, player.x
  end

  def update
    sprites.each { |sprite| sprite.update }
  end

  def draw
    sprites.each { |sprite| sprite.draw }
  end

  def receive_input input
    move_player(player.y, player.x - 1) if input == Gosu::KbLeft
    move_player(player.y, player.x + 1) if input == Gosu::KbRight
    move_player(player.y - 1, player.x) if input == Gosu::KbUp
    move_player(player.y + 1, player.x) if input == Gosu::KbDown
  end

  private

  def move_player y, x
    position = board.position(y, x)

    if position.open?
      player.y = y
      player.x = x
      position.occupy(player)
    end
  end

  attr_reader :board, :player
end
