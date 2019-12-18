class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :store_id
      t.string :image_id
      t.string :comment
      t.timestamps
    end
  end
end
