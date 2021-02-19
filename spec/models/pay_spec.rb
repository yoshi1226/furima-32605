require 'rails_helper'

RSpec.describe Pay, type: :model do
  before do
    @pay = FactoryBot.build(:pay)
  end

  describe '商品購入についてのテスト' do

    context "購入できる時" do
      it "必要な情報を適切に入力すると、商品の購入ができること" do
        expect(@pay).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@pay).to be_valid
      end

    context "購入できない時" do
      it '郵便番号が必須であること' do
        @pay.postal_code = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Postal code is invalid")
      end
      
      it '都道府県が必須であること' do
        @pay.prefecture_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '市町村が必須であること' do
        @pay.city = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @pay.addresses = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Addresses can't be blank")
      end
      
      it '電話番号が必須であること' do
        @pay.phone_number = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'ユーザー情報が必須であること' do
        @pay.user_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("User can't be blank")
      end
      
      it 'アイテム情報が必須であること' do
        @pay.item_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号にはハイフンが必要であること（123-4567となる）' do
        @pay.postal_code = 0000-0000
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end

      it '電話番号が11桁以上では登録できないこと' do
        @pay.shopping_fee_status_id = 111111111111
        @pay.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status must be other than 1")
      end

      
        it "priceが空では登録できないこと" do
          @pay.price = nil
          @pay.valid?
          expect(@order.errors.full_messages).to include("Price can't be blank")
        end
      
        it "tokenが空では登録できないこと" do
          @pay.token = nil
          @pay.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end

# - 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# - 郵便番号にはハイフンが必要であること（123-4567となる）
# - 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）

# FactoryBot.define do
#   factory :pay do
#     prefecture_id {1}
#     city          {"東京都"}
#     addresses     {"1-1"}
#     phone_number  {00000000000}
#     user_id       {1}
#     item_id       {1}
#     token         {"tok_abcdefghijk00000000000000000"}
#   end
# end