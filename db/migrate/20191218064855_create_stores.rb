class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.integer :owner_id
      t.string :store_name
      t.integer :store_postal_cade
      t.string :store_prefecture_code
      t.string :store_city
      t.string :store_building
      t.string :store_phone_number
      t.string :store_category
      t.string :good
      t.string :image_id
      t.string :introduction
      t.timestamps
    end
  end
end
