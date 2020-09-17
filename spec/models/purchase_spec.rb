require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'IDの保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase).to be_valid
    end
    
  end
end
