class VisitornumbersController < ApplicationController
  before_action :set_visitornumber, only: [:show, :edit, :update, :destroy]
  before_action :set_campernumber, only: [:show, :edit, :update, :destroy]
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  before_action :set_weather, only: [:show, :edit, :update, :destroy]
  before_action :set_monthly_fire_level, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @visitornumbers = Visitornumber.all
    @weathers = Weather.all
    respond_with(@visitornumbers, @weathers)
  end

  def show
    @weathers = Weather.all
    respond_with(@visitornumber, @campernumber, @park, @monthly_fire_level, @weathers)
  end

  def new
    @visitornumber = Visitornumber.new
    respond_with(@visitornumber)
  end

  def edit
  end

  def create
    @visitornumber = Visitornumber.new(visitornumber_params)
    @visitornumber.save
    respond_with(@visitornumber)
  end

  def update
    @visitornumber.update(visitornumber_params)
    respond_with(@visitornumber)
  end

  def destroy
    @visitornumber.destroy
    respond_with(@visitornumber)
  end

  private
    def set_visitornumber
      @visitornumber = Visitornumber.find(params[:id])
    end

    def visitornumber_params
      params.require(:visitornumber).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end

    def set_campernumber
      @campernumber = Campernumber.find(params[:id])
    end

    def campernumber_params
      params.require(:campernumber).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end

  def set_park
    @park = Park.find(params[:id])
  end

  def park_params
    params.require(:park).permit(:park_name, :state)
  end

  def set_weather
    @weather = Weather.find(params[:id])
  end

  def weather_params
    params.require(:weather).permit(:park_name, :date, :temp, :precip, :wind, :humidity, :fireLevel)
  end

  def set_monthly_fire_level
    @monthly_fire_level = MonthlyFireLevel.find(params[:id])
  end

  def monthly_fire_level_params
    params.require(:monthly_fire_level).permit(:park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
  end
end
