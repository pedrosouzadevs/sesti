class AddQuiverRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :quiver, null: false, foreign_key: true
  end
end
