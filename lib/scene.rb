class Scene
  attr_reader :board,
              :player,
              :sprites

  def initialize
    @player = Player.new
    @heart_meter = HeartMeter.new @player
    reset
  end

  def update
    sprites.each { |sprite| sprite.update }
  end

  def draw
    sprites.each { |sprite| sprite.draw }
  end

  def receive_input input
    if input == Gosu::KbN
      reset
    end

    return if player.dead?

    move_player(player.board_y, player.board_x - 1) if [Gosu::KbLeft,  Gosu::KbE].include?(input)
    move_player(player.board_y, player.board_x + 1) if [Gosu::KbRight, Gosu::KbF].include?(input)
    move_player(player.board_y - 1, player.board_x) if [Gosu::KbUp,    Gosu::KbC].include?(input)
    move_player(player.board_y + 1, player.board_x) if [Gosu::KbDown,  Gosu::KbD].include?(input)
  end

  private

  def sprites
    @sprites ||= [@board, @player, @heart_meter]
  end

  def reset
    if player.dead?
      @player = Player.new
      @heart_meter = HeartMeter.new @player
    end

    @board = Board.new
    @sprites = nil
    move_player 2, 0
  end

  def move_player y, x
    position = board.position(y, x)

    if position.exit?
      reset
    elsif position.open?
      player.board_y = y
      player.board_x = x
      position.occupy(player)
      player.position position.background.y,
                      position.background.x
    end
  end

  attr_reader :board, :player
end
