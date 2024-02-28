class AddEquipsRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :equip, null: false, foreign_key: true
  end
end
