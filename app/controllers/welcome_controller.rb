class WelcomeController < ApplicationController
  def index
    @beer = Beer.all
  end
end
