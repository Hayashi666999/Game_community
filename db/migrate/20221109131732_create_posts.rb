class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
    t.integer :genre_id, null: false
    t.string :nice, null: false
    
      t.timestamps
    end
  end
end
