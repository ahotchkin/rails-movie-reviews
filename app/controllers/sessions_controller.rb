class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, except: :destroy

  def new
  end

  def create
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @error = "Incorrect username or password."
      render :new
    end
  end

  def omnilogin
    @user = User.from_omniauth(auth)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "That email already exists in our database. Please login or sign up with a different email address."
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def auth
      request.env["omniauth.auth"]
    end

end
