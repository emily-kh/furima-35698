class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  # def destroy
  #   @item = Item.find(params[:id])
  # end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   @item.update(item_params)
  # end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name,:description,:price, :condition_id,:burden_id,:prefecture_id,:period_id,:category_id).merge(user_id: current_user.id)
  end

end
