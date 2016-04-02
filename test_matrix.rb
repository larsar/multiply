require_relative "matrix"
require "test/unit"

class TestMatrix < Test::Unit::TestCase

  def setup
    @matrix = Matrix.new(2,5,3,8)
  end

  def test_matrix_boundary_variabes
    assert_equal(2, @matrix.instance_variable_get(:@x_from))
    assert_equal(5, @matrix.instance_variable_get(:@x_to))
    assert_equal(3, @matrix.instance_variable_get(:@y_from))
    assert_equal(8, @matrix.instance_variable_get(:@y_to))
  end

  def test_matrix_storage_size
    assert_equal()
  end



  end