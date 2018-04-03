class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.integer :status, null: false
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
