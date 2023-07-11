class AddEquipRefToSessions < ActiveRecord::Migration[7.0]
  def change
    add_reference :sessions, :equip, null: false, foreign_key: true
  end
end
