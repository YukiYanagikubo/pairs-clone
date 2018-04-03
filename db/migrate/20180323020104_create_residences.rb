class CreateResidences < ActiveRecord::Migration[5.0]
  def change
    create_table :residences do |t|
      t.string :prefecture, null: false
      t.timestamps
    end
  end
end
