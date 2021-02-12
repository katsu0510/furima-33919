require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do
    it "入力条件を満たしていれば出品できる" do
      expect(@item).to be_valid
    end


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
    it "state_idが空だと出品できない" do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "State can't be blank"
    end
    it "ship_cost_idが空だと出品できない" do
      @item.ship_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Ship cost can't be blank"
    end
    it "prefecture_idが空だと出品できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it "ship_dayが空だと出品できない" do
      @item.ship_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Ship day can't be blank"
    end
    it "priceが空だと出品できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    
    it "priceが半角数字でないと出品できない" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it "priceが330~9999999の範囲でないと出品できない" do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end



  end

end
