class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.timestamp :created_at, null: false, default: -> {"current_timestamp"}
      t.timestamp :updated_at, null: false, default: -> {"current_timestamp"}

      t.timestamps
    end
  end
end
