require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "入力条件を満たしていれば登録できる" do
      expect(@user).to be_valid
    end


    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "emailは＠を含むこと" do
      @user.email = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = 'k0000' 
      @user.password_confirmation = 'k0000' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password" 
    end
    it "passwordが英語のみであれば登録できない" do
      @user.password = 'kkkkkk' 
      @user.password_confirmation = 'kkkkkk' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "passwordが数字のみであれば登録できない" do
      @user.password = '111111' 
      @user.password_confirmation = '111111' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "passwordが全角では登録できない" do
      @user.password = '１１１１１K' 
      @user.password_confirmation = '１１１１１K' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "k_first_nameが空では登録できない" do
      @user.k_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "K first name can't be blank"
    end
    it "k_last_nameが空では登録できない" do
      @user.k_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "K last name can't be blank"
    end
    it 'last_nameが全角入力でなければ登録できないこと' do
      @user.last_name =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "birth_dayが空では登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it 'k_last_nameが全角カタカナ入力でなければ登録できないこと' do
      @user.k_last_name =  "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include "K last name is invalid"
    end
    it 'k_first_nameが全角カタカナ入力でなければ登録できないこと' do
      @user.k_first_name =  "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include "K first name is invalid"
    end
  end
end
