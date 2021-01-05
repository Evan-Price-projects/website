class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.where(name: params[:session][:name]).exists?
    user2 = User.where(name: params[:session][:name])
    if user && user2.pluck(:password_digest)[0] == Digest::SHA2.hexdigest(params[:session][:password_digest])
      temp = User.where(name: params[:session][:name]).pluck("session_token")
      puts(temp)
      puts(session[:session_token])
      session[:session_token] = temp
      puts(session[:session_token])
      self.set_current_user
      puts("this is current user #{@current_user.name} session token #{@current_user.session_token} pass #{@current_user.password_digest}")
      redirect_to tables_path
    else
      flash[:notice] = "Sorry. Incorrect Name or Password"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:name] = nil
    session[:password_digest] = nil
    session[:session_token] = nil
    redirect_to root_path
  end
end
