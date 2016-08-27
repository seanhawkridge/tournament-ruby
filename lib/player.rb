class Player

  attr_reader :name

  def initialize name
    @name = name.to_sym
  end

end
