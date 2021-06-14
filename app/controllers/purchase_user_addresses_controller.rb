class PurchaseUserAddressesController < ApplicationController
  # def index
  #   @purchase_user_address = PurchaseUserAddress.new
  # end

  # def create
  #   @purchase_user_address = PurchaseUserAddress.new(purchase_user_params)
  #   if @purchase_user_address.valid?
  #     @purchase_user_address.save
  #     redirect_to root_path
  #   else
  #     render :index
  #   end
  # end

  # private

  # def purchase_user_params
  #   params.require(:purchase_user_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  # end
end
