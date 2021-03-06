class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show,:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
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
  
  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name,:description,:price, :condition_id,:burden_id,:prefecture_id,:period_id,:category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user.id == current_user.id && !@item.purchase_user.present?
        redirect_to root_path
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
