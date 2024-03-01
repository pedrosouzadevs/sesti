class AddWandRefToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_reference :wands, :weapon, null: false, foreign_key: true
  end
end
