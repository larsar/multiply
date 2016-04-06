require_relative "../multiplication_store"
require "test/unit"

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
    assert_raise {@ms.get(@x_min-1, @y_min)}
    assert_raise {@ms.get(@x_min, @y_min-1)}
    assert_raise {@ms.get(@x_min, @y_max+1)}
    assert_raise {@ms.get(@x_min+1, @y_max)}
  end

  def test_initial_data_set
    @x_min.upto(@x_max) do |x|
      @y_min.upto(@y_max) do |y|
        assert_nil(@ms.get(@x_min, @y_min))
      end
    end
  end

  def test_equality
    @ms.set(@x_min, @y_min, 1)
    assert_equal(1, @ms.get(@x_min, @y_min))
    assert_true(@ms.get(@x_min, @y_min) === @ms.get(@y_min, @x_min))
  end

  def test_data_set_length
    assert_equal(3, @ms.num_unset)
    @ms.store_answer(@x_min, @y_min, 5)
    assert_equal(2, @ms.num_unset)
  end



end