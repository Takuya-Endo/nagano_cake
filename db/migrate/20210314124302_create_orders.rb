class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :shipping_postal_code, null: false
      t.string :shipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :shipping_fee, null: false
      t.integer :total_payment, null: false
      t.integer :payment, null: false
      t.integer :order_status, null: false, default: 1
      t.timestamp :created_at, null: false, default: -> {"current_timestamp"}
      t.timestamp :updated_at, null: false, default: -> {"current_timestamp"}

      t.timestamps
    end
  end
end
