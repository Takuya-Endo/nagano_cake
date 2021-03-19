class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamp :created_at, null: false, default: -> {"current_timestamp"}
      t.timestamp :updated_at, null: false, default: -> {"current_timestamp"}

      t.timestamps
    end
  end
end
