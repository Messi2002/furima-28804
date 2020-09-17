require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入内容の保存' do
    before do
     @user = FactoryBot.create(:user)
     @seller = FactoryBot.create(:user)
     @item = FactoryBot.build(:item,user_id:@seller.id)
     @item.image = fixture_file_upload('public/images/test_image.png')
     @item.save
     @purchase_order = FactoryBot.build(:purchase_order, user_id:@user.id,item_id:@item.id)
     sleep 2
    end
 describe '購入情報登録' do
  context '購入情報登録がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
     expect(@purchase_order).to be_valid
    end
  end

  context '購入情報登録がうまくいかないとき' do
    it 'postal_codeが空だと保存できないこと' do
    @purchase_order.postal_code = nil
    @purchase_order.valid?
     expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @purchase_order.postal_code = '1234567'
    @purchase_order.valid?
     expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
     @purchase_order.prefecture = 0
     @purchase_order.valid?
     expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空だと保存できないこと' do
    @purchase_order.city = nil
    @purchase_order.valid?
     expect(@purchase_order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
    @purchase_order.house_number = nil
    @purchase_order.valid?
     expect(@purchase_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
    @purchase_order.building_name = nil
     expect(@purchase_order).to be_valid
    end
    it '電話番号は空だと保存できないこと' do
    @purchase_order.phone_number = nil
    @purchase_order.valid?
     expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
    end
     it '電話番号にはハイフンは不要で、11桁以内であること' do
      @purchase_order.phone_number = 12345-678901
      @purchase_order.valid?
       expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
    end
   end
  end
end
end
