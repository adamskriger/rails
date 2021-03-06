class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path(@user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    session[:current_user_id] = nil
    @user.destroy
    redirect_to root_path
  end


  def index
    @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password,:password_confirmation)
  end


end
