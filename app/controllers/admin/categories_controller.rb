class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category: '#{@category.name}' created!"
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    category_name = @category.name
    @category.destroy
    redirect_to [:admin, :categories], notice: "Category: '#{category_name}' deleted!"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
