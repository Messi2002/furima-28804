class PurchaseOrder
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number,:token,:item_id, :user_id, :purchase_id
  
  
  validates :token, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, presence: true, format: {with: /\A\d{11}\z/}
  validates :city, :house_number,  presence: true
  
  def save
   pu = Purchase.create(item_id: item_id, user_id: user_id) 
   Order.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_id: pu.id) 
  end
end
