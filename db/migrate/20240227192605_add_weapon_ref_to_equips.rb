class AddWeaponRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :weapon, null: false, foreign_key: true
  end
end
