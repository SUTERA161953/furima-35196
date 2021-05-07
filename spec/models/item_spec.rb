require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'imageとnameとdescriptionとcategory_idとstatus_idとcharge_idとarea_idとdays_idとpriceが存在していれば保存できること' do
      expect(@item).to be_valid 
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it 'status_idが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end

    it 'charge_idが空では登録できない' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank", "Charge is not a number")
    end
    
    it 'area_idが空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end

    it 'days_idが空では登録できない' do
      @item.days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank", "Days is not a number")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは300〜9,999,999の間でなければ登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300〜9,999,999の範囲内で入力してください")
    end

    it 'priceは半角数字でなければ登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
    end
  end
end
