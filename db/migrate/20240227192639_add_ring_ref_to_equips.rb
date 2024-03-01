class AddRingRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :ring, null: false, foreign_key: true
  end
end
