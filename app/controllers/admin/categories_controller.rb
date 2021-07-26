class Admin::CategoriesController < ApplicationController
  def index
    # @categories = Category.order(name: :desc).all
  end
  def new
    # @category = Category.new
  end
  def create
    # @category = Product.new(category_params)

    # if @category.save
    #   redirect_to [:admin, :categories], notice: 'Category created!'
    # else
    #   render :new
    # end
  end
end
