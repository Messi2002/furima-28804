class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one :item_user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :ship_location
  belongs_to_active_hash :preparation_day

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :postage_payer_id, :preparation_day_id, :ship_location_id
  end

  # 空の投稿を保存できないようにする,文字制限
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters. ' },

                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :item, :introduction,:image, presence: true
end
