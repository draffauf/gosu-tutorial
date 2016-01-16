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
    move_player(player.y, player.x - 1) if [Gosu::KbLeft,  Gosu::KbE].include?(input)
    move_player(player.y, player.x + 1) if [Gosu::KbRight, Gosu::KbF].include?(input)
    move_player(player.y - 1, player.x) if [Gosu::KbUp,    Gosu::KbC].include?(input)
    move_player(player.y + 1, player.x) if [Gosu::KbDown,  Gosu::KbD].include?(input)
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
