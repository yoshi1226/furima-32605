class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

validates :nickname, presence: true
validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
validates :last_name_kana, presence: true, format:{with: /(?=.*[ア-ン])/}
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
validates :first_name_kana, presence: true, format:{with: /(?=.*[ア-ン])/}
validates :birthday, presence: true

# validates : email,     presence: true
# validates : email,     uniqueness: true
# validates : email,     inclusion: 
# # validates : password,  presence: true
# validates : password,  length: { minimum: 6 }
# validates : password,  confirmation: true
end

# - ニックネームが必須であること
# - メールアドレスが必須であること
# - メールアドレスが一意性であること
# - メールアドレスは、@を含む必要があること
# - パスワードが必須であること
# - パスワードは、6文字以上での入力が必須であること
# - パスワードは、半角英数字混合での入力が必須であること（実装が必要
# - パスワードは、確認用を含めて2回入力すること
# - パスワードとパスワード（確認用）、値の一致が必須であること