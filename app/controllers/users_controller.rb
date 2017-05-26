class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    pastry = Pastry.find(params[:user][:pastry_id])
    if @user.update(user_params)
      redirect_to pastry_path(pastry)
    else
      redirect_to pastry_path(pastry)
    end
  end

  # cette méthode permet au user de mettre à jour les champs de son profil directement depuis son profil en js. Voir application.js pour le reste du code

  # def update_from_profile

  #    @user = User.find(params[:id])

  #     if @user.update(user_params)
  #     respond_to do |format|
  #       format.html { redirect_to user_path(current_user) }
  #       format.js  # <-- will render `app/views/reviews/create.js.erb`
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { redirect_to user_path(current_user) }
  #       format.js  # <-- idem
  #     end
  #   end

  # end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:address, :phone_number)
  end
end
