require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do
    context '保存できる場合' do
      it "入力条件を満たしていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "category_idが0だと出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end
      it "state_idが空だと出品できない" do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it "state_idが0だと出品できない" do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 0"
      end
      it "ship_cost_idが空だと出品できない" do
        @item.ship_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship cost can't be blank"
      end
      it "ship_cost_idが0だと出品できない" do
        @item.ship_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship cost must be other than 0"
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "prefecture_idが0だと出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end
      it "ship_dayが空だと出品できない" do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship day can't be blank"
      end
      it "ship_day_idが0だと出品できない" do
        @item.ship_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship day must be other than 0"
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end


      it "priceが全角文字では出品できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが半角英数字混合では出品できない" do
        @item.price = 'ka500'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが半角英語だけでは出品できない" do
        @item.price = 'kaka'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが299円だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceが10000000の範囲でないと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 999999"
      end
    end


  end

end
