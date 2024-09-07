class ClosetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @closets = Closet.all
  end

  def new
    @closet = Closet.new
  end

  def create
    closet = Closet.new(closet_params)
    if closet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @closet = Closet.find(params[:id])
    @tops = Closet.where(genre: "Tops")
    @bottoms = Closet.where(genre: "Bottoms")
  
    if @closet.genre == "Tops"
      @associated_items = @bottoms
    elsif @closet.genre == "Bottoms"
      @associated_items = @tops
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Closet not found."
    redirect_to root_path
  end

  def edit
    @closet = Closet.find(params[:id])
  end

  def update
    closet = Closet.find(params[:id])
    if closet.update(closet_params)
      redirect_to :action => "show", :id => closet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    closet = Closet.find(params[:id])
    closet.destroy
    redirect_to action: :index
  end

  private
  def closet_params
    params.require(:closet).permit(:body, :image, :genre)
  end
end
