class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.string :nice
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
