class DescriptionsController < ApplicationController
  def description_params
    params.require(:descriptions).permit(:header, :description)
  end

  def show
    id = params[:id] # retrieve description ID from URI route
    @description = description.find(id) # look up description by unique ID
    # will render app/views/descriptions/show.<extension> by default
  end

  def index
    @descriptions = description.all
  end

  def new
    # default: render 'new' template
  end

  def create
    if (@description = description.create!(description_params))
      flash[:warning] = "#{@description.title} created."
      redirect_to descriptions_path
    else
      flash[:warning] = "description #{@description.title} could not be created: " +
          @description.errors.full_messages.join(",")
      render 'new'
    end
  end