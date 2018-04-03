class AddHeightToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :height, foreign_key: true
  end
end
