class CreateOccupancies < ActiveRecord::Migration[5.0]
  def change
    create_table :occupancies do |t|
      t.string  :occupancy, null:false
      t.timestamps
    end
  end
end
