require_relative "../multiplication"
require "test/unit"

class TestMultiplication < Test::Unit::TestCase

  def setup
    @x = 2
    @y = 7
    @m = Multiplication.new(@x, @y)
  end

  def test_boundary_variabes
    assert_equal(@x, @m.instance_variable_get(:@x))
    assert_equal(@y, @m.instance_variable_get(:@y))
  end

  def test_not_answered
    assert_false(@m.has_answer?)
    assert_false(@m.correct_answer?)
  end

  def test_correct_answer
    @m.answer = @x * @y
    assert_true(@m.has_answer?)
    assert_true(@m.correct_answer?)
  end

  def test_false_answer
    @m.answer = 99
    assert_true(@m.has_answer?)
    assert_false(@m.correct_answer?)
  end

  def test_equal_objects
    assert_false(@m == 'Not correct object')
    assert_false(@m == Multiplication.new(@x+1, @y+1))
    assert_true(@m == Multiplication.new(@x, @y))
    assert_true(@m == Multiplication.new(@y, @x))
  end

end