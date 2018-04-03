class AddOccupancyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :occupancy, foreign_key: true
  end
end
