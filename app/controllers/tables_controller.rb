class TablesController < ApplicationController
  def home
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @table = Table.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  def create
      @table=Table.create!(params[:id])
      redirect_to new_card_path(request.parameters)
  end
  def destroy
    @table = Table.find(params[:id])
    t1 = @table.id
    @table.destroy
    Card.find_each(table_id:t1) do |card|
      card.destroy
    end
    redirect_to tables_path
  end
  def index
    @tables = Table.all
  end

  def new
    # default: render 'new' template
  end
end