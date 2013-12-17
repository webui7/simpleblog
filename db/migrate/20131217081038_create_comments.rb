class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :post_id
      t.timestamps
      t.timestamps
    end
  end
end
