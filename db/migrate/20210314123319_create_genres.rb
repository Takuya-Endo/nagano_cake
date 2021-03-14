class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.timestamp :created_at, null: false, default: -> {"current_timestamp"}
      t.timestamp :updated_at, null: false, default: -> {"current_timestamp"}

      t.timestamps
    end
  end
end
