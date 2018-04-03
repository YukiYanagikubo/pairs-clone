class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string  :community_name, null: false
      t.integer :category, null: false
      t.string  :image, null: false

      t.timestamps
    end
  end
end
