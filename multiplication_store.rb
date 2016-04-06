class MultiplicationStore


  def initialize(x_min, x_max, y_min, y_max)
    @data = {}
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
        @data[m.hash_key] = m unless @data.has_key?(m.hash_key)
      end
    end
  end

  def set_answer(x, y, value)
    check_bounds(x,y)
    m = @data[[x,y]]
    m.answer = value
  end

  def get_answer(x, y)
    check_bounds(x,y)

    @data[[x,y]].answer
  end

  def num_total
    @data.keys.length
  end

  def num_unanswered
    i = 0
    @data.keys.each do |key|
      i = i + 1 unless @data[key].has_answer?
    end
    i
  end

  def num_answered
    num_total - num_unanswered
  end

  def num_correct
    i = 0
    @data.keys.each do |key|
      i = i + 1 if @data[key].has_answer? && @data[key].correct_answer?
    end
    i
  end

  def num_incorrect
    num_total - num_correct - num_unanswered
  end

  def check_bounds(x,y)
    raise "x < minimum (#{@x_min})" if x < @x_min
    raise "y < minimum (#{@y_min})" if y < @y_min
    raise "x > maximum (#{@x_max})" if x > @x_max
    raise "y > maximum (#{@y_max})" if y > @y_max
  end


end