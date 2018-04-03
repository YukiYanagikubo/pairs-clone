class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :income, null:false
      t.timestamps
    end
  end
end
