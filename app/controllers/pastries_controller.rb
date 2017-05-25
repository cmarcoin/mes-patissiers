class PastriesController < ApplicationController
  before_action :find_pastry, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:search, :show]
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

    # TODO == refacto
    @hash =  Gmaps4rails.build_markers([@pastry.baker]) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
    @user = current_user
  end

  def edit
    if current_user == @pastry.baker
    end
  end

  def update
    if current_user == @pastry.baker
      @pastry.update(pastry_params)
      redirect_to pastry_path(@pastry)
      flash[:notice] = "#{current_user.first_name} votre pâtisserie a bien été éditée"
    else
      redirect_to root_path
      flash[:alert] = "#{current_user.first_name} edition impossible"
    end
  end

  def search
    @search = params[:search]
    @users = User.near("#{params[:search]}", 5)
    if params[:search] =! ""
      @pastries = find_pastries_by_location(@users)
      # @pastries = Pastry.search(params[:search]).order("created_at DESC")
    else
      @pastries = Pastry.all
    end

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
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
    params.require(:pastry).permit(:category, :name, :description, :slices,
                                   :order_warning, :price, :photo, :photo_cache,
                                   :pastry_id)
  end
end
