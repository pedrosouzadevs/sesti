class AddBootRefToEquips < ActiveRecord::Migration[7.0]
  def change
    add_reference :equips, :boot, null: false, foreign_key: true
  end
end
