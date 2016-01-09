class InputManager
  attr_accessor :target

  def button_down id
    target.receive_input id
  end
end
