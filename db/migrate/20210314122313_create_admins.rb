class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.timestamp :created_at, null: false, default: -> {"current_timestamp"}
      t.timestamp :updated_at, null: false, default: -> {"current_timestamp"}

      t.timestamps
    end
  end
end
