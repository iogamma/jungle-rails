class ReviewsController < ApplicationController
  def create
    @parent = Product.find_by_id params[:product_id]

    if current_user
      @review = Review.new({
        product_id: params[:product_id],
        user_id: current_user.id,
        description: review_params[:description],
        rating: review_params[:rating]
      })
      if @review.save
        redirect_to @parent
      else
        redirect_to @parent
      end
    else
      redirect_to @parent
    end
  end

  def review_params
    params.require(:review).permit(:product_id,
                                   :description,
                                   :rating)
  end
end
