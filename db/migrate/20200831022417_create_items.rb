class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item 
      t.text :introdaction
      t.string :image
      t.integer :rdetail
      t.integer :category
      t.integer :status
      t.integer :price
      t.integer :postage_payer_id
      t.integer :parparation_day_id
      t.integer :ship_location_id
      t.references :user
      t.timestamps
    end
  end
end
