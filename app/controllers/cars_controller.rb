class CarsController < ApplicationController

  def create
    
  end

  def new
    car = Car.new(params[:make],params[:model_year])
    cookies[:car] = car.to_yaml
    redirect_to '/status'
  end

  def status
    @car = YAML.load(cookies[:car])

    # if session[:make].nil?
    #   cookies[:make] = params[:make]
    #   @make = cookies[:make]
    # end
    #
    # if cookies[:model_year].nil?
    #   cookies[:model_year]= params[:model_year]
    #   @model_year = cookies[:model_year]
    # end
    #
    # if cookies[:speed].nil?
    #   cookies[:speed] = 0
    #   @speed = cookies[:speed]
    # end

    # @make = cookies[:make]
    # @model_year = cookies[:model_year]
    # @speed = cookies[:speed]

  end

  def accelerate
    # Car.new(params[:make],params[:model_year])
    @car = YAML.load(cookies[:car])
    @car.accelerate
    cookies[:car] = @car.to_yaml
    redirect_to '/status'

  end

  def brake

    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    redirect_to '/status'

  end

  def light_switch

    @car = YAML.load(cookies[:car])
    @car.light_switch
    cookies[:car] = @car.to_yaml
    redirect_to '/status'
  end
end
