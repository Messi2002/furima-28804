require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品情報の登録' do
    context '商品情報の登録がうまくいくとき' do
      it 'item,introduction,category_id,status_id,price,postage_payer_id,preparation_day_id,ship_location_id,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300以上であること' do
        price = '300'
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥9999999以下であること' do
        price = '9999999'
        expect(@item).to be_valid
      end
      it '販売価格は半角数字のみ入力可能であること' do
        price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品情報の登録がうまくいかなかったとき' do
      it 'itemが空だと登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'introductionが空だと登録できない' do
        @item.introduction = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'category_idを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?

        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idを選択しないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'priceが空だと登録できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'postage_payer_idを選択しないと登録できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end
      it 'preparation_day_idを選択しないと登録できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
      end
      it 'ship_location_idを選択しないと登録できない' do
        @item.ship_location_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship location must be other than 1')
      end
      it 'priceが¥299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが¥10000000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'imageがないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
