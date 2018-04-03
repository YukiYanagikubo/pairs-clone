class AddIncomeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :income, foreign_key: true
  end
end
