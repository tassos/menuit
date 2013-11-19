class BeersController < ApplicationController
  helper_method :sort_column, :sort_direction
  def new
    @beer = Beer.new(params[:id])
  end
  def show
    @beer = Beer.find(params[:id])
  end
  def create
    @beer = Beer.new(params[:beer].permit(:name, :brewery, :vol, :description))
    if @beer.save
      redirect_to @beer
    else
      render 'new'
    end
  end
  def index
    @beers = Beer.order(sort_column + " " + sort_direction)
  end
  def edit
    @beer = Beer.find(params[:id])
  end
  def update
    @beer = Beer.find(params[:id])
    if @beer.update(params[:beer].permit(:name, :brewery, :vol, :description))
      redirect_to @beer
    else
      render 'edit'
    end
  end
  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    
    redirect_to beers_path
  end
  
  private
    def sort_column
      Beer.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
