class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|

    t.string :nickname, null: false
    t.string :email, null: false, default: ""
    t.string :encrypted_password, null: false, default: ""
    t.string :like_list
    t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
