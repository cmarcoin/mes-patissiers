class PastriesController < ApplicationController
  def index
    @pasties = Pastry.all
  end

  def new
    @pastry = Pastry.new
  end

  def create
    @pastry = Pastry.new(pastry_params)


  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private

  def pastry_params
    params.require(:pastry).permit(:category, :name, :description, :slices,
                                   :order_warning, :price, :baker_id)
  end
end
