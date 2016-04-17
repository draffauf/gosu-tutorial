class Scene
  attr_reader :board,
              :player,
              :sprites

  def initialize board:  Board.new,
                 player: Player.new
    @board   = board
    @player  = player
    @sprites = [@board, @player, HeartMeter.new(@player)]

    move_player Position.new
  end

  def update
    sprites.each { |sprite| sprite.update }
  end

  def draw
    sprites.each { |sprite| sprite.draw }
  end

  def receive_input input
    move_player Position.new(delta_attributes(input))
  end

  private

  def delta_attributes input
    #XXX TODO
    # Extract class Controller, extract methods
    # .left?, .right?, .up?, .down?
    if    [Gosu::KbLeft,  Gosu::KbE].include?(input)
      { y: 0,  x: -1 }
    elsif [Gosu::KbRight, Gosu::KbF].include?(input)
      { y: 0,  x: 1  }
    elsif [Gosu::KbUp,    Gosu::KbC].include?(input)
      { y: -1, x: 0  }
    elsif [Gosu::KbDown,  Gosu::KbD].include?(input)
      { y: 1,  x: 0  }
    else
      { y: 0,  x: 0  }
    end
  end

  def move_player position
    new_position       = player.board_position + position
    new_board_position = board.position(new_position)

    if new_board_position.open?
      player.board_position = new_position
      new_board_position.occupy(player)
    end
  end

  attr_reader :board, :player
end
