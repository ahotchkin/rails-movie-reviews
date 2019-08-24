class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Please enter all requested information."
      render :new
    end
  end

  def show
    @reviews = Review.all.order({ created_at: :desc }).first(10)
    if current_user
      render :show
    else
      redirect_to root_path
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :admin)
    end

end
