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

    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'category_idが1では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'status_idが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
    end

    it 'status_idが1では登録できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it 'charge_idが空では登録できない' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank", 'Charge is not a number')
    end

    it 'charge_idが1では登録できない' do
      @item.charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Charge must be other than 1')
    end

    it 'area_idが空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
    end

    it 'area_idが1では登録できない' do
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end

    it 'days_idが空では登録できない' do
      @item.days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank", 'Days is not a number')
    end

    it 'days_idが1では登録できない' do
      @item.days_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days must be other than 1')
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが299以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 300〜9,999,999の範囲内で入力してください')
    end

    it 'priceが10,000,000以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 300〜9,999,999の範囲内で入力してください')
    end

    it 'priceが半角英数字混合では登録できない' do
      @item.price = '300a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが半角英字のみでは登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 300〜9,999,999の範囲内で入力してください', 'Price is not a number')
    end

    it 'priceが全角では登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 300〜9,999,999の範囲内で入力してください', 'Price is not a number')
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
