require_relative "multiply"
require "test/unit"

class TestMultiply < Test::Unit::TestCase
  assert_equal(4, Multiply.new(3,4).x )
end