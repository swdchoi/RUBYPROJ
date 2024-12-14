module Towable
  def can_tow?(pounds) 
    pounds < 2000
  end
end


class Vehicle
  
  attr_accessor :color
  attr_reader :year
  @@numberV = 0

  def initialize (year, color, model)
    @year = year
    @color = color
    @model = model
    @currentspeed = 0
    @@numberV += 1
  end

    def self.numberV
      puts "has #{@@numberV}"
    end

    def currentspeed
      @currentspeed
    end

    def speed_up(number)
      @currentspeed += number
      puts "You go faster #{number}"
    end

    def brake(number)
      @currentspeed -= number
    end

    def shutoff (number)
      @currentspeed = 0
    end

    def self.gasMile (miles, gallon)
      puts miles / gallon
    end

    def to_s 
      puts "This is #{@model}"
    end

end

class MyCar < Vehicle
NUMBER_OF_DOOR = 4
include Towable
end

class Truck < Vehicle
NUMBER_OF_DOOR = 6
include Towable
end


fer = MyCar.new(2022, "black", "GPU")
pip = Truck.new(2021, "white", "CS#")

puts MyCar.Towable(500)

