class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :content
      t.integer :parent_id
      t.integer :reply_id

      t.timestamps
    end
  end
end
