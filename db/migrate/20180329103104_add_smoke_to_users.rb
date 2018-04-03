class AddSmokeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :smoke, foreign_key: true
  end
end
