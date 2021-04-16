class CatsController < ApplicationController

  def index 
   @cats = Cat.all   
  end 

  def show
   @cat = Cat.find_by_id(params[:id])
   redirect_to '/' if !@cat
  end


end
