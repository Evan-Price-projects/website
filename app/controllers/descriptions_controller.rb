class DescriptionsController < ApplicationController
  def description_params
    params.require(:descriptions).permit(:header, :description)
  end

  def show
    id = params[:id] # retrieve description ID from URI route
    @description = Description.find(id) # look up description by unique ID
      # will render app/views/descriptions/show.<extension> by default
  end

  def index
    @descriptions = Description.all
  end

  def new
    # default: render 'new' template
  end

  def create

  end
end