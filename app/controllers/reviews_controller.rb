class ReviewsController < ApplicationController
  before_action :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: "Your review has been posted."
    else
      redirect_to @product, alert: "Sorry, we could not save your review. Please contact support."
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    review = @product.reviews.find(params[:id])
    review.destroy
    flash[:notice] = "Your comment has been deleted"
    redirect_to @product
  end

  private

  def review_params
    params.require(:review).permit(:description,
                                   :rating)
  end
end
