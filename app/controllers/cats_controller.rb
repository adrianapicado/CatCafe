class CatsController < ApplicationController

  def index 
   @cats = Cat.all
  end 

  def show
   @cat = Cat.find_by_id(params[:id])
  end


end
