require 'rails_helper'

RSpec.describe Pay, type: :model do
  before do
    @pay = FactoryBot.build(:pay)
  end

  describe '商品購入についてのテスト' do
    context "購入できる時" do
      it '配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号・price・tokenが存在すれば購入できる' do
        expect(@pay).to be_valid
      end

      it '建物名が入力されていても購入できる' do
        @pay.building = nil
        expect(@pay).to be_valid
      end
    end

    context "購入できない時" do
      it '郵便番号が必須である' do
        @pay.postal_code = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Postal code is invalid")
      end
      
      it '都道府県が必須である' do
        @pay.prefecture_id = 1
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it '市町村が必須である' do
        @pay.city = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須である' do
        @pay.addresses = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Addresses can't be blank")
      end
      
      it '電話番号が必須である' do
        @pay.phone_number = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'ユーザー情報が必須である' do
        @pay.user_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("User can't be blank")
      end
      
      it 'アイテム情報が必須である' do
        @pay.item_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号にはハイフンが必要である（123-4567となる）' do
        @pay.postal_code = "0000000"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Postal code is invalid")
      end

      it '電話番号にはハイフンは不要で、11桁以内である（09012345678となる）' do
        @pay.phone_number = "090123456789"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は数字以外が混じっていると購入できない' do
        @pay.phone_number = "abcdefghijk"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Phone number is invalid")
      end

        it "tokenが空では登録できない" do
          @pay.token = nil
          @pay.valid?
          expect(@pay.errors.full_messages).to include("Token can't be blank")
        end
    end
  end
end
