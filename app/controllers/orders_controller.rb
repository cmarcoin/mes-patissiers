class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :update, :destroy]
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @pastry = Pastry.find(params[:pastry_id])
    @order.pastry = @pastry
    @user = current_user
    if @order.save
       redirect_to user_path(current_user)
    else
       render "pastries/show"
    end
  end

  def show
  end

  def update
    @order.validate
    @order.save
    redirect_to user_path(current_user)
  end

  def destroy
    if current_user == @order.user
      @order.destroy
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user) # Temporaire
      flash[:alert] = "Une erreur s'est produite. Suppression impossible"
    end
  end


  private

  def order_params
    params.require(:order).permit(:delivery_date, :status, :quantity)
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
