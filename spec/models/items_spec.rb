require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品についてのテスト' do

    context "保存できる時" do
      it "商品情報が全て揃っていれば出品が保存される" do
        expect(@item).to be_valid
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context "保存できない時" do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it '商品名が必須であること' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it '商品の説明が必須であること' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      
      it '商品の状態についての情報が必須であること' do
        @item.sales_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status is not a number")
      end
      
      it '配送料の負担についての情報が必須であること' do
        @item.shopping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status is not a number")
      end
      
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
      end
      
      it '価格についての情報が必須であること' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '半角英数混合では登録できないこと' do
        @item.price = "a12"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '半角英語だけでは登録できないこと' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '299円以下では登録できないこと' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '10,000,000以上では登録できないこと' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it 'category_idが「1」では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'prefecture_idが「1」では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'sales_status_idが「1」では登録できないこと' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end

      it 'scheduled_delivery_idが「1」では登録できないこと' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end

      it 'shopping_fee_status_idが「1」では登録できないこと' do
        @item.shopping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status must be other than 1")
      end
    end
  end
end