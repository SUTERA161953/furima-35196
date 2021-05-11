require 'rails_helper'

RSpec.describe BuyShip, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_ship = FactoryBot.build(:buy_ship, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_ship).to be_valid
      end
      
      it 'buildingは空でも保存できること' do
        @buy_ship.building = ''
        expect(@buy_ship).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @buy_ship.token = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @buy_ship.postal_code = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式では保存できないこと' do
        @buy_ship.postal_code = '1234567'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postal_codeが半角英数字混合では保存できないこと' do
        @buy_ship.postal_code = '123-456a'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      
      it 'area_idが空では登録できない' do
        @buy_ship.area_id = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end

      it 'area_idが1では登録できない' do
        @buy_ship.area_id = 1
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include('Area must be other than 1')
      end

      it 'municipalityが空では登録できない' do
        @buy_ship.municipality = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では登録できない' do
        @buy_ship.address = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @buy_ship.phone_number = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Phone number can't be blank", "Phone number is too short", "Phone number is invalid. Input only number")
      end

      it 'phone_numberが9桁以下では登録できない' do
        @buy_ship.phone_number = '090123456'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_numberが12桁以上では登録できない' do
        @buy_ship.phone_number = '090123456789'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Phone number is too long")
      end

      it 'phone_numberが半角英字のみでは登録できない' do
        @buy_ship.phone_number = 'abcdefghijk'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @buy_ship.user_id = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @buy_ship.item_id = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
