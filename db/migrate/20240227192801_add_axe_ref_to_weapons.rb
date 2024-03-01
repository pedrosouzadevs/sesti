class AddAxeRefToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_reference :axes, :weapon, null: false, foreign_key: true
  end
end
