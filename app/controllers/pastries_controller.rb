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
    @pastry.user = current_user
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
    if params[:search]
      @pastries = Pastry.search(params[:search]).order("created_at DESC")
    else
      @error = "Aucun résultat pour votre recherche"
    end
  end

  def destroy
    @pastry.destroy
    redirect_to root_path
  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

  def pastry_params
    params.require(:pastry).permit(:category, :name, :description, :slices,
                                   :order_warning, :price)
  end
end
