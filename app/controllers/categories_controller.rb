class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  def index
    authorize! :read, Category
    @categories = current_user.categories
  end

  def show
    @category = Category.find_by(id: params[:id])
    authorize! :read, @category
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def new
    authorize! :create, Category
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    authorize! :create, Category
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    @category = Category.find_by(id: params[:id])
    authorize! :update, @category
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    authorize! :destroy, @category
    @category.destroy
    redirect_to categories_path
  end

private
  def category_params
    params.require(:category).permit(:user_id, :name, :poem_ids => [])
  end
end
