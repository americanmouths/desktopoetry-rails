class PoemsController < ApplicationController
  before_action :authorize

  def index
    @poems = current_user.poems.order(id: :desc)
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(poem_params)
    @poem.category.user_id = current_user.id
    if @poem.save
      redirect_to poem_path(@poem)
    else
      render :new
    end
  end

  def show
    @poem = Poem.find_by(id: params[:id])
    @category = Category.find_by(name: @poem.category_name)
  end

  def edit
    @poem = Poem.find_by(id: params[:id])
  end

  def update
    @poem = Poem.find_by(id: params[:id])
    @poem.update(poem_params)
    redirect_to poem_path(@poem)
  end

  def destroy
    @poem = Poem.find_by(id: params[:id])
    @poem.destroy
    redirect_to poems_path
  end

  private
  def poem_params
    params.require(:poem).permit(:title, :content, :category_name, :user_id, :date)
  end
end
