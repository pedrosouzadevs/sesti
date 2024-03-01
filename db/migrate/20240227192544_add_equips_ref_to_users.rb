class AddEquipsRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :user, null: true, foreign_key: true
  end
end
