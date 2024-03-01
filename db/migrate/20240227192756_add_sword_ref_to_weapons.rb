class AddSwordRefToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_reference :swords, :weapon, null: false, foreign_key: true
  end
end
