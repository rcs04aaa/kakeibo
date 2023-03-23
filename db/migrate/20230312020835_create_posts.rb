class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :content, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.date :payment_at, null: false
      t.boolean :bookmark, null: false, default: false

      t.timestamps
    end
  end
end
