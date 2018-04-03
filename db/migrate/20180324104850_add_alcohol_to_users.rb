class AddAlcoholToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :alcohol, foreign_key: true
  end
end
