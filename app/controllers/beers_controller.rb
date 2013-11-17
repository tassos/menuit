class BeersController < ApplicationController
  def new
    @beer = Beer.new(params[:id])
  end
  def show
    @beer = Beer.find(params[:id])
  end
  def create
    @beer = Beer.new(params[:beer].permit(:name, :brewery, :vol))
    @beer.save
    redirect_to @beer
  end
  def index
    @beers = Beer.all
  end
end
