class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

with_options presence: true do
validates :nickname
validates :birthday
end

validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
validates :last_name
validates :first_name
end

validates :last_name_kana, presence: true, format:{with: /(?=.*[ア-ン])/}
validates :first_name_kana, presence: true, format:{with: /(?=.*[ア-ン])/}
end