class PastriesController < ApplicationController
  before_action :find_pastry, only: [:show, :edit, :update, :destroy]
  def index
    @pastries = Pastry.all
  end

  def new
    @pastry = Pastry.new
  end

  def create
    @pastry = Pastry.new(pastry_params)
    @pastry.baker = current_user
    if @pastry.save
      redirect_to pastry_path(@pastry)
    else
      render :new
    end
  end

  def show
    @order = Order.new
  end

  def edit
  end

  def update
    @pastry.update(pastry_params)
    redirect_to pastry_path(@pastry)
    flash[:notice] = "#{current_user.first_name} votre pâtisserie a bien été éditée"
  end

  def search
    @search = params[:search]
    if params[:search] =! ""
      @users = User.near("#{params[:search]}", 5)
      @pastries = find_pastries_by_location(@users)
      # @pastries = Pastry.search(params[:search]).order("created_at DESC")
    else
      @pastries = Pastry.all
    end
  end

  def destroy
    @pastry.destroy
    redirect_to root_path
  end

  private

  def find_pastries_by_location(users)

    pastries_array = []
    user_pastries_array = []

    users.each do |user|
      user.pastries.each do |pastry|
        user_pastries_array << pastry
      end
    end

    user_pastries_array.each do |pastry|
      pastries_array << pastry
    end

    return pastries_array
  end


  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

  def pastry_params
    params.require(:pastry).permit(:category, :name, :description, :slices, :order_warning, :price, :photo, :photo_cache, :pastry_id)
  end
end
