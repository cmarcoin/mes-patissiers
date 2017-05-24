class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    pastry = Pastry.find(params[:user][:pastry_id])
    if @user.update(user_params)
      redirect_to pastry_path(pastry)
    else
      redirect_to pastry_path(pastry)
    end
  end

  private
  def user_params
    params.require(:user).permit(:address, :phone_number)
  end
end
