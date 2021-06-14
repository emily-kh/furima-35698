class PurchaseUserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :phone_number, :user_id, :item_id, :token, :building

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :item_id
    validates :token
    validates :phone_number,format: {with: /\A\d{10,11}\z/}

    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end

  def save
    purchase_user = PurchaseUser.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, building: building, purchase_user_id: purchase_user.id)
  end
end