require 'minitest/autorun'
require './calculation'

class CalculationTest < MiniTest::Unit::TestCase

  def setup
    @calculation = Calculation.new(23,23)
  end

  def test_refute
    refute_nil @calculation.result
  end

  def test_class
    assert_instance_of Calculation, @calculation
  end
  
  def test_kind_of
    assert_kind_of Object, @calculation
  end

  def test_addition
    assert_equal 46, @calculation.result
  end

  def test_subtraction
    calculation = Calculation.new(20,10,"-")
    assert_equal 10, calculation.result
  end

  def test_multiplication
    calculation = Calculation.new(3,3,"*")
    assert_equal 9, calculation.result
  end

  def test_division
    calculation = Calculation.new(12,4,"/")
    assert_equal 3, calculation.result
  end
end
