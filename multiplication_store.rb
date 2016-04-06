class MultiplicationStore


  def initialize(x_min, x_max, y_min, y_max)
    @data = []
    @x_min = x_min
    @x_max = x_max
    @y_min = y_min
    @y_max = y_max
    load
  end

  def load
    @x_min.upto(@x_max) do |x|
      @y_min.upto(@y_max) do |y|
        m = Multiplication.new(x,y)
        @data << m unless @data.include?(m)
      end
    end
    @num_unset = @data.length
  end

  def store_answer(x, y, value)

  end

  def get(x, y)
    raise 'Foobar'
    0
  end

  def num_unset
    @num_unset
  end



end