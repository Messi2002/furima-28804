class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item 
      t.text :introduction
      t.integer :category_id  , null: false
      t.integer :status_id    , null: false
      t.integer :price
      t.integer :postage_payer_id
      t.integer :preparation_day_id
      t.integer :ship_location_id
      t.references :user
      t.timestamps
    end
  end
end
