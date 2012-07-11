require 'test/unit'
require 'calcexam'
require 'mocha'

class CalcexamTest < Test::Unit::TestCase
  def teardown
    STDOUT.unstub(:puts)
  end

  def test_interval_parsing
    matrix = Calcexam::Matrix.new()
    assert_equal [5,16,78],     matrix.send(:parse_interval, [5,16,78])
    assert_equal (23..45).to_a, matrix.send(:parse_interval, '23..45')
    assert_equal [3,73,65],     matrix.send(:parse_interval, '3,73,65')
    assert_equal [567],         matrix.send(:parse_interval, '567')
  end

  def test_matrix_size
    matrix = Calcexam::Matrix.new(:*, [5,16,78], '23..45')
    assert_equal 69, matrix.size
    matrix = Calcexam::Matrix.new(:*, '3,5,7', '456..459')
    assert_equal 12, matrix.size
  end

  def test_matrix_each
    matrix = Calcexam::Matrix.new(:*, '5..7', '3,4')
    count = 0
    matrix.each do |a, b|
      assert [5,6,7].include?(a) && [3,4].include?(b), "each() sends to the block parameters from outside of intervals"
      count += 1
    end
    assert_equal matrix.size, count, "each() don't yields block m*n times"
  end

  def test_exam_results
    Sickill::Rainbow.enabled = false
    STDOUT.stubs(:puts)
    STDOUT.expects(:puts).with 'Results: 75.0% (3/4)'

    exam = Calcexam::Exam.new
    exam.right_answer!
    exam.right_answer!
    exam.try_again
    exam.wrong_answer!
    exam.right_answer!
    exam.results
  end
end
