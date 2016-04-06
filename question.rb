class Question
  attr_accessor :answer

  def initialize(x, y)
    @x = x
    @y = y
  end

  def has_answer?
    !@answer.nil?
  end

  def correct_answer?
    @answer == @x * @y
  end

  def ==(obj)
    if obj.equal?(self)
      return true
    elsif !self.class.equal?(obj.class)
      return false
    end

    return (@x == obj.x && @y == obj.y) || (@x == obj.y&& @y == obj.x)
  end

  def x
    @x
  end

  def y
    @y
  end

  def hash_key
    [@x, @y].sort
  end

end