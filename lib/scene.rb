class Scene
  attr_reader :board,
              :player,
              :sprites

  def initialize board:  Board.new,
                 player: Player.new
    @board       = board
    @player      = player
    @heart_meter = HeartMeter.new(player)
    @sprites     = [@board, @player, @heart_meter]

    @player.board_position = board.starting_position
    board.move(player: player)
  end

  def update
    sprites.each { |sprite| sprite.update }
  end

  def draw
    sprites.each { |sprite| sprite.draw }
  end

  def receive_input input
    board.move player: player,
               delta_position: Position.new(delta_attributes(input))
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
end
