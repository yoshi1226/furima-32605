class Pay
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,       format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :addresses
    validates :phone_number,      format: {with: /\A\d{11}\z/}
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end
  
  validates :prefecture_id,     numericality: { other_than: 1 }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end