class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(:password => params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Incorrect username or password."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
