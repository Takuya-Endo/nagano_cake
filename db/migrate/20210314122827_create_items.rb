class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      # t.integer :genre_id, null: false
      t.string :name, null: false
      # t.string :image_id, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      # t.boolean :is_active, null: false, default: true
      t.timestamp :created_at, null: false#, default: -> {"current_timestamp"}
      t.timestamp :updated_at, null: false#, default: -> {"current_timestamp"}

      t.timestamps
    end
  end
end
