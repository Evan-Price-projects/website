class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:tablename)
  end
  def new
    # default: render 'new' template

  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  def wel
  end
  def update
    @user = User.find params[:id]
    if (@user.update_attributes(user_params))
      flash[:warning] = "#{@user.name} updated tablename to #{@user.tablename}."
      redirect_to user_path(@user)
    else
      flash[:warning] = "tablename could not be updated: " +
        @user.errors.full_messages.join(",")
      render 'edit'
    end
  end
  def create

     if User.exists?(['name LIKE ?',"%#{params["user"]["name"]}"])
      flash[:notice] = "Sorry, this users-id is taken. Try again."
      redirect_to new_user_path
     else
       params[:tablename] = "Table 1"
      @users = User.create_user!(params)  #User.create!(user_params)
      flash[:notice] = "Welcome #{@users.name}. Your account has been created."
      redirect_to login_path
    end
  end
  def edit
    @tables = Table.all
    @user = User.find params[:id]
  end
  def assign_current_user_table
    @user = User.where(name: @current_user.name).first
    @user.update(tablename: params[:user])
    redirect_to tables_path
  end

end