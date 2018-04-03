class AddLivingWithToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :living_with, foreign_key: true
  end
end
