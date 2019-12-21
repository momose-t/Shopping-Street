class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.string :message
      t.boolean :is_customer
      t.timestamps
    end
  end
end
