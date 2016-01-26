class Scene
  attr_reader :board,
              :player,
              :sprites

  def initialize
    @board       = Board.new
    @player      = Player.new
    @heart_meter = HeartMeter.new @player
    @sprites     = [@board, @player, @heart_meter]

    move_player Position.new
  end

  def update
    sprites.each { |sprite| sprite.update }
  end

  def draw
    sprites.each { |sprite| sprite.draw }
  end

  def receive_input input
    position_delta =
      if    [Gosu::KbLeft,  Gosu::KbE].include?(input)
        Position.new(y: 0, x: -1)
      elsif [Gosu::KbRight, Gosu::KbF].include?(input)
        Position.new(y: 0, x: 1)
      elsif [Gosu::KbUp,    Gosu::KbC].include?(input)
        Position.new(y: -1, x: 0)
      elsif [Gosu::KbDown,  Gosu::KbD].include?(input)
        Position.new(y: 1, x: 0)
      else
        Position.new(y: 0, x: 0)
      end

    move_player position_delta
  end

  private

  def move_player position
    board_position = board.position(
      player.position + position
    )

    if board_position.open?
      player.position = player.position + position
      board_position.occupy(player)
    end
  end

  attr_reader :board, :player
end
