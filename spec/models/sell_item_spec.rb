require 'rails_helper'

RSpec.describe SellItem, type: :model do
  before do
    @user =FactoryBot.create(:user)
    @item =FactoryBot.create(:item)
    @sell_item = FactoryBot.build(:sell_item, user_id: @user.id, item_id: @item.id)
   end
  describe '購入機能の実装' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@sell_item).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと保存できない' do
        @sell_item.postal_code = nil
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号にはハイフンがないと保存できないこと' do
        @sell_item.postal_code = '1234567'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと保存できない' do
        @sell_item.delivery_area_id = nil
        @sell_item.valid?
       
        expect(@sell_item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area is not a number")
      end
      it '都道府県データのIDが1だとでないと保存できない' do
        @sell_item.delivery_area_id = 1
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it '市区町村が空だと保存できない' do
        @sell_item.city = nil
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @sell_item.address = nil
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @sell_item.phone_number = nil
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Phone number number is invalid. Include half-width numbers")

      end
      it '電話番号にはハイフンは不要で、11桁以内でないと保存できない' do
        @sell_item.phone_number = '111-1111-111'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Phone number number is invalid. Include half-width numbers")
      end
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityは空でも保存できること' do
      end
      it 'house_numberは空でも保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
      it 'priceが空だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
      it 'priceが1円未満では保存できないこと' do
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
      end

    end
  end
end