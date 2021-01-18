require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      @user = build(:user)
      expect(@user).to be_valid
    end

    it 'nick_nameがない場合は登録できないこと' do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors[:nick_name]).to include("can't be blank")
    end

    'emailがない場合は登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'emailに@がない場合は登録できないこと' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'passwordがない場合は登録できないこと' do
      @user.password.nil
      @user.valid?
      expect(@user.errors[password]).to include("can't be blank")
    end

    it 'password_confirmationがない場合は登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors[:password_confirmation]).include("doesn't match Password")
    end

    it 'last_nameがない場合は登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it 'last_name_kanaがない場合は登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("can't be blank")
    end

    it 'first_nameがない場合は登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'first_name_kanaがない場合は登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
    end
    it 'birthdayがない場合は登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user = create(:user)
      another_user = build(;user, email: @user.email)
      another_user.valid?
      expect(another user.error[:email]).to include('has already been taken')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'last_nameが全角入力でなければ登録できないこと' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:last_name]).to include('is invalid')
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:first_name]).to include('is invalid')
    end

    it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include('is invalid')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include('is invalid')
    end

    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'passwordが全角では登録できないこと' do
      @user.password = 'ａａａ１１１'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'passwordとpassword_confirmationは値が同じでないと登録できないこと' do
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
