class CreateFoots < ActiveRecord::Migration[5.0]
  def change
    create_table :foots do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :visitor_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
