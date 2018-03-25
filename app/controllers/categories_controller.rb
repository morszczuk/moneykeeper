class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    Category.new(category_params).save!
    redirect_to categories_path
  end

  def update
    category = Category.find(params[:id])
    category.name = category_params[:name]
    category.save!
    redirect_to categories_path
  end

  def destroy
    Category.find(params[:id]).destroy!
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
