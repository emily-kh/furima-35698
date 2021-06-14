class PurchaseUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :emi_params
  before_action :ami_params, only: [:index]
  
  def index
    @purchase_user_address = PurchaseUserAddress.new
  end

  def create
    @purchase_user_address = PurchaseUserAddress.new(purchase_user_params)
    if @purchase_user_address.valid?
      pay_item
      @purchase_user_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  

  def emi_params
    @item = Item.find(params[:item_id])
  end


  def ami_params
    redirect_to root_path if  @item.purchase_user.present? || current_user.id == @item.user.id 
    end
  

  def purchase_user_params
    params.require(:purchase_user_address).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :price, :user, :item).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_user_params[:token],
      currency: 'jpy'
    )
  end
end
end
