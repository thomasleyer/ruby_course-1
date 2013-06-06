#! /usr/bin/env ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'turn'
require './coffee_machine'

class CoffeeTest < MiniTest::Unit::TestCase

  def setup
    @cm = CoffeeMachine.new
  end

  def fill_machine
    @cm.refill_coffee(CoffeeMachine::COFFEE_FOR_CUP)
    @cm.refill_water(CoffeeMachine::WATER_FOR_CUP)
  end
  
  # test for empty supply tanks after a new machine has been created
  def test_empty_tanks_after_creation
    assert_equal 0, @cm.coffee_level
    assert_equal 0, @cm.water_level
  end
  
  def test_new_machine_cannot_prepare_coffee
    assert_raises NoWaterException, NoCoffeeException do
      @cm.make_coffee
    end
  end
  
  # test to check the cleaning counter is set to 12 after creation
  def test_initial_cleaning_counter
    assert_equal CoffeeMachine::CLEANING_INTERVAL, @cm.cups_left
  end
  
  # test to check if coffee refill method fills the correct
  # amount of coffee in the appropriate supply tank
  def test_refill_coffee_amount
    assert_equal 0, @cm.coffee_level
    @cm.refill_coffee(200)
    assert_equal 200, @cm.coffee_level
  end

  # test to check if the water refill method fills the correct
  # amount of water in the appropriate supply tank
  def test_refill_water_amount
    assert_equal 0, @cm.water_level
    @cm.refill_water(200)
    assert_equal 200, @cm.water_level
  end

  # test to check in the coffee refill method has an alert mechanism
  # in case of overfill
  def test_coffee_overfill
    @cm.refill_coffee(200000)
    assert_raises ToMuchCoffeeException
  end
  
  # test to check if the water refill method has an alert mechanism
  # in case of overfill
  def test_water_overfill
    @cm.refill_water(200000)
    assert_raises ToMuchWaterException
  end

  # test to check if coffee can be prepared
  def test_coffee_process
    fill_machine
    assert_equal "Kaffee fertig", @cm.make_coffee 
  end

  def test_coffee_level_after_coffee_preparation
    fill_machine
    @cm.make_coffee
    assert_equal 0, @cm.coffee_level
  end

  def test_water_level_after_coffee_preparation
    fill_machine
    @cm.make_coffee
    assert_equal 0, @cm.water_level
  end

  def test_sum_of_cups_counter_after_coffee_preparation
    fill_machine
    @cm.make_coffee
    assert_equal 1, @cm.sum_of_cups
  end

  def test_cleaning_interval_counter_after_coffee_preparation
    fill_machine
    @cm.make_coffee
    assert_equal CoffeeMachine::CLEANING_INTERVAL - 1, @cm.cups_left
  end

  def test_cleaning_counter_after_cleaning
    @cm.clean
    assert_equal CoffeeMachine::CLEANING_INTERVAL, @cm.cups_left
  end 

  def test_info_returns_string
    assert_instance_of String, @cm.info
  end

  def test_cleaning_is_required_after_twelve_coffees
    CoffeeMachine::CLEANING_INTERVAL.times do
      fill_machine
    end
    CoffeeMachine::CLEANING_INTERVAL.times do
      @cm.make_coffee
    end
    assert_raises CleaningException, @cm.make_coffee
  end












end
