require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_destination = FactoryBot.build(:order_destination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_destination).to be_valid
    end

    it 'post_codeが空だと保存できないこと' do
      @order_destination.post_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_destination.post_code = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order_destination.prefecture_id = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_destination.city= ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_destination.address= ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_destination.building_name = ''
      expect(@order_destination).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @order_destination.token= ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @order_destination.user_id= ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @order_destination.item_id= ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Item can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_destination.phone_number= ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁未満だと保存できないこと' do
      @order_destination.phone_number= '123456789'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
    end

  end
end

