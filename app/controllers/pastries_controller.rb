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
    if @pastry.save
      redirect_to pastry_path(@pastry)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @pastry.update(pastry_params)
    redirect_to pastry_path(@pastry)
    flash[:notice] = "#{current.user.first_name} votre pâtisserie a bien été éditée"
  end

  def destroy
    @pastry.destroy
    redirect_to root_path
  end

  def search(search)
    where("name iLIKE ?" , "%#{search}%")
  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

  def pastry_params
    params.require(:pastry).permit(:category, :name, :description, :slices,
                                   :order_warning, :price, :baker_id)
  end
end
