class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than:9_999_999 }
    validates :info, length: {maximum: 1000 }
    validates :name, length: {maximum: 40}
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :scheduled_delivery_id
    validates :prefecture_id
    validates :sales_status_id
    validates :shopping_fee_status_id
  end
end