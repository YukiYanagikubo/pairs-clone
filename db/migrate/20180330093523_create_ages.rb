class CreateAges < ActiveRecord::Migration[5.0]
  def change
    create_table :ages do |t|
      t.string :age, null:false
      t.timestamps
    end
  end
end
