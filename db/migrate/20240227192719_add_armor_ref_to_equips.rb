class AddArmorRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :armor, null: false, foreign_key: true
  end
end
