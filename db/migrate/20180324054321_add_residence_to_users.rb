class AddResidenceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :residence, foreign_key: true
  end
end
