class CreateLivingWiths < ActiveRecord::Migration[5.0]
  def change
    create_table :living_withs do |t|
      t.string  :living_with, null:false
      t.timestamps
    end
  end
end
