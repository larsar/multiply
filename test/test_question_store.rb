require_relative '../question_store'
require 'test/unit'

class TestQuestionStore < Test::Unit::TestCase

  def setup
    @x_min = 1
    @x_max = 2
    @y_min = 1
    @y_max = 2
    @qs = QuestionStore.new(@x_min, @x_max, @y_min, @y_max)
  end

  def test_boundary_variabes
    assert_equal(@x_min, @qs.instance_variable_get(:@x_min))
    assert_equal(@x_max, @qs.instance_variable_get(:@x_max))
    assert_equal(@y_min, @qs.instance_variable_get(:@y_min))
    assert_equal(@y_max, @qs.instance_variable_get(:@y_max))
  end

  def test_boundary_error_handeling
    assert_raise { @qs.get_answer(@x_min - 1, @y_min) }
    assert_raise { @qs.get_answer(@x_min, @y_min - 1) }
    assert_raise { @qs.get_answer(@x_min, @y_max + 1) }
    assert_raise { @qs.get_answer(@x_min+1, @y_max + 1) }
  end

  def test_initial_data_set
    @x_min.upto(@x_max) do |x|
      @y_min.upto(@y_max) do |y|
        assert_nil(@qs.get_answer(@x_min, @y_min))
      end
    end
  end

  def test_equality
    @qs.set_answer(@x_min, @y_min, 1)
    assert_equal(1, @qs.get_answer(@x_min, @y_min))
    assert_true(@qs.get_answer(@x_min, @y_min) === @qs.get_answer(@y_min, @x_min))
  end

  def test_num_unanswered
    assert_equal(3, @qs.num_total)
    assert_equal(3, @qs.num_unanswered)
    @qs.set_answer(@x_min, @y_min, 5)
    assert_equal(2, @qs.num_unanswered)
    @qs.set_answer(@x_min, @y_min, 4)
    assert_equal(2, @qs.num_unanswered)
  end

  def test_num_correct
    @qs.set_answer(1, 2, 2)
    assert_equal(1, @qs.num_answered)
    assert_equal(2, @qs.num_unanswered)
    assert_equal(0, @qs.num_incorrect)
  end

  def test_num_incorrect
    @qs.set_answer(1, 2, 2)
    @qs.set_answer(2, 2, 99)
    @qs.set_answer(1, 1, 88)
    assert_equal(0, @qs.num_unanswered)
    assert_equal(1, @qs.num_correct)
    assert_equal(2, @qs.num_incorrect )
  end

  def test_next_question
    assert_equal(@qs.next_unanswered_question, [1,1])
    @qs.set_answer(1, 1, 1)
    assert_equal(@qs.next_unanswered_question, [1,2])
    @qs.set_answer(1, 2, 99)
    assert_equal(@qs.next_unanswered_question, [2,2])
    @qs.set_answer(2, 2, 88)
    assert_raise { @qs.next_unanswered_question }
  end

  def test_random_question
    3.times do |i|
      q = @qs.random_unanswered_question
      @qs.set_answer(q[0], q[1], q[0] * q[1])
    end
    assert_raise { @qs.random_unanswered_question }
    assert_raise { @qs.next_unanswered_question }
  end


end