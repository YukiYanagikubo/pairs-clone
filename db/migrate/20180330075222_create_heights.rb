class CreateHeights < ActiveRecord::Migration[5.0]
  def change
    create_table :heights do |t|
      t.string :height, null:false
      t.timestamps
    end
  end
end
