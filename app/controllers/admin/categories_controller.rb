class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

  # def destroy
  #   @product = Product.find params[:id]
  #   @product.destroy
  #   redirect_to [:admin, :products], notice: 'Product deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
