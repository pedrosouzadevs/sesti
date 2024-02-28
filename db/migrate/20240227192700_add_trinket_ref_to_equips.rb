class AddTrinketRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :trinket, null: false, foreign_key: true
  end
end
