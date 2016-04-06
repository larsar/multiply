require_relative '../multiplication_store'
require 'test/unit'

class TestMultiplicationStore < Test::Unit::TestCase

  def setup
    @x_min = 1
    @x_max = 2
    @y_min = 1
    @y_max = 2
    @ms = MultiplicationStore.new(@x_min, @x_max, @y_min, @y_max)
  end

  def test_boundary_variabes
    assert_equal(@x_min, @ms.instance_variable_get(:@x_min))
    assert_equal(@x_max, @ms.instance_variable_get(:@x_max))
    assert_equal(@y_min, @ms.instance_variable_get(:@y_min))
    assert_equal(@y_max, @ms.instance_variable_get(:@y_max))
  end

  def test_boundary_error_handeling
    assert_raise { @ms.get_answer(@x_min - 1, @y_min) }
    assert_raise { @ms.get_answer(@x_min, @y_min - 1) }
    assert_raise { @ms.get_answer(@x_min, @y_max + 1) }
    assert_raise { @ms.get_answer(@x_min+1, @y_max + 1) }
  end

  def test_initial_data_set
    @x_min.upto(@x_max) do |x|
      @y_min.upto(@y_max) do |y|
        assert_nil(@ms.get_answer(@x_min, @y_min))
      end
    end
  end

  def test_equality
    @ms.set_answer(@x_min, @y_min, 1)
    assert_equal(1, @ms.get_answer(@x_min, @y_min))
    assert_true(@ms.get_answer(@x_min, @y_min) === @ms.get_answer(@y_min, @x_min))
  end

  def test_num_unanswered
    assert_equal(3, @ms.num_total)
    assert_equal(3, @ms.num_unanswered)
    @ms.set_answer(@x_min, @y_min, 5)
    assert_equal(2, @ms.num_unanswered)
    @ms.set_answer(@x_min, @y_min, 4)
    assert_equal(2, @ms.num_unanswered)
  end

  def test_num_correct
    @ms.set_answer(1, 2, 2)
    assert_equal(1, @ms.num_answered)
    assert_equal(2, @ms.num_unanswered)
    assert_equal(0, @ms.num_incorrect)
  end

  def test_num_incorrect
    @ms.set_answer(1, 2, 2)
    @ms.set_answer(2, 2, 99)
    @ms.set_answer(1, 1, 88)
    assert_equal(0, @ms.num_unanswered)
    assert_equal(1, @ms.num_correct)
    assert_equal(2, @ms.num_incorrect )
  end


end