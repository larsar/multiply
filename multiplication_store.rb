class MultiplicationStore

  def initialize(x_min, x_max, y_min, y_max)
    @x_min = x_min
    @x_max = x_max
    @y_min = y_min
    @y_max = y_max
  end

  def set(x, y, value)

  end

  def get(x, y)
    raise 'Foobar'
    0
  end

  def num_unset
    0
  end

end