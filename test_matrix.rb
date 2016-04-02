require_relative "matrix"
require "test/unit"

class TestMatrix < Test::Unit::TestCase
  @x_from = 2
  @x_to = 5
  @y_from = 3
  @y_to = 8

  def setup
    @matrix = Matrix.new(, 5, 3, 8)
  end

  def test_matrix_boundary_variabes
    assert_equal(2, @matrix.instance_variable_get(:@x_from))
    assert_equal(5, @matrix.instance_variable_get(:@x_to))
    assert_equal(3, @matrix.instance_variable_get(:@y_from))
    assert_equal(8, @matrix.instance_variable_get(:@y_to))
  end

  def test_matrix_storage_size
    assert_raise(@matrix.get(1, 3))
    assert_raise(@matrix.get(2, 2))
    assert_raise(@matrix.get(3, 9))
    assert_raise(@matrix.get(2, 2))
  end


end