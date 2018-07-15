class CategoriesController < ApplicationController
  before_action :authorize

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to categories_path
  end

private
  def category_params
    params.require(:category).permit(:user_id, :name, :poem_ids => [])
  end
end
