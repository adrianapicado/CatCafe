class CatsController < ApplicationController

  def show
   @cat = Cat.find_by_id(params[:id])
   redirect_to '/' if !@cat
  end


end
