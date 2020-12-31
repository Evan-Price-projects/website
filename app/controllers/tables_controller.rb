class TablesController < ApplicationController
  def home
  end
  def table_params
    params.require(:table).permit(:UserID)
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @table = Table.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  def create
    x = table_params
      @table=Table.create!(table_params)
      redirect_to new_card_path(request.parameters)
  end
  def destroy
    @table = Table.find(params[:id])
    t1 = @table.UserID
    @table.destroy
    Card.find_each(UserID:t1) do |card|
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