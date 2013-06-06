class NoCoffeeException < Exception
  def to_s ; "Nicht ausreichend Kaffee vorhanden" ; end
end

class ToMuchCoffeeException < Exception
  def to_s ; "Zuviel Kaffee" ; end
end

class ToMuchWaterException < Exception
  def to_s ; "Zuviel Wasser" ; end
end

class NoWaterException < Exception
  def to_s; "Nicht ausreichend Wasser vorhanden." ; end
end

class CleaningException < Exception
  def to_s; "Maschine muss gereinigt werden." ; end
end

class CoffeeMachine

  COFFEE_FOR_CUP = 8
  WATER_FOR_CUP = 150
  CLEANING_INTERVAL = 12

  attr_reader :max_coffee, :max_water, :coffee_level, :water_level, :sum_of_cups, :cups_left

  def initialize(max_coffee = 300, max_water = 2000)
    @max_coffee = max_coffee
    @max_water = max_water
    @coffee_level = 0
    @water_level = 0
    @sum_of_cups = 0
    @cups_left = CLEANING_INTERVAL
  end

  def refill_coffee(amount)
    if(amount > max_coffee - coffee_level)
      raise ToMuchCoffeeException
    else
      @coffee_level += amount
    end
  end

  def refill_water(amount)
    if(amount > max_water - water_level)
      raise ToMuchWaterException
    else
      @water_level += amount
    end
  end

  def make_coffee
    if(@coffee_level < COFFEE_FOR_CUP)
      #return "Fuellstand Kaffee zu niedrig."
      raise NoCoffeeException
    elsif(@water_level < WATER_FOR_CUP)
      raise NoWaterException
    elsif(@cups_left == 0)
      raise CleaningException
    else
      @coffee_level -= COFFEE_FOR_CUP
      @water_level -= WATER_FOR_CUP
      @sum_of_cups += 1
      @cups_left -= 1
      return "Kaffee fertig"
    end
  end

  def clean
    @cups_left = CLEANING_INTERVAL
  end

  def info
    info = "#### INFORMATIONEN ####\n"
    info << "Fuellstand Kaffee: #{@coffee_level} g.\n"
    info << "Fuellstand Wasser: #{@water_level} ml.\n"
    info << "Gesamtzahl Tassen: #{@sum_of_cups}.\n"
    info <<  "Reinigung in #{@cups_left} Tassen.\n"
    info
  end
end
