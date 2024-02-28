class AddLegRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :leg, null: false, foreign_key: true
  end
end
