class PoemsController < ApplicationController
  load_and_authorize_resource
  
  def index
    authorize! :read, Poem
    @poems = current_user.poems.order(id: :desc)
  end

  def new
    authorize! :create, Poem
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(poem_params)
    authorize! :create, Poem
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
    authorize! :read, Poem
  end

  def edit
    @poem = Poem.find_by(id: params[:id])
  end

  def update
    @poem = Poem.find_by(id: params[:id])
    authorize! :update, Poem
    @poem.update(poem_params)
    redirect_to poem_path(@poem)
  end

  def destroy
    @poem = Poem.find_by(id: params[:id])
    authorize! :destroy, Poem
    @poem.destroy
    redirect_to poems_path
  end

  private
  def poem_params
    params.require(:poem).permit(:title, :content, :category_name, :user_id, :date)
  end
end
