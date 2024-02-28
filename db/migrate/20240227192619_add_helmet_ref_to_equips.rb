class AddHelmetRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :helmet, null: false, foreign_key: true
  end
end
