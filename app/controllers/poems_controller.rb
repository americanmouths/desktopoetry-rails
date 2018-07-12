class PoemsController < ApplicationController

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(poem_params)
    redirect_to poem_path(@poem)
  end

  def show
    @poem = Poem.find_by(id: params[:id])
  end

  private
  def poem_params
    params.require(:poem).permit(:title, :content, :category_name, :user_id)
  end
end
