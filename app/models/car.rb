class Car
  attr_accessor :make, :model_year, :speed, :lights

  def initialize(make, model_year)
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = "OFF"
  end

  def accelerate
    @speed+=10
  end

  def brake
    @speed >= 7 ? @speed -= 7 : @speed = 0
  end

  def light_switch
    @lights == "OFF" ? @lights = "ON" : @lights = "OFF"
  end

end
