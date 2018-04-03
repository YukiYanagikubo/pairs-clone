class CreateSmokes < ActiveRecord::Migration[5.0]
  def change
    create_table :smokes do |t|
      t.string  :frequency, null:false
      t.timestamps
    end
  end
end
