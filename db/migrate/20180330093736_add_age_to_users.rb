class AddAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :age, foreign_key: true
  end
end
