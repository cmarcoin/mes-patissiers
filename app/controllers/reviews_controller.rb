class ReviewsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.order = @order
    @user = current_user
    if @review.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
