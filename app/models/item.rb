class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase_user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :period
  belongs_to :category
  
  with_options presence:true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :condition_id 
      validates :burden_id
      validates :prefecture_id
      validates :period_id
      validates :category_id
    end
    with_options format: { with: /\A[0-9]+\Z/ } do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end
  end
end
