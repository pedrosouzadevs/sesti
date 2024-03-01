class AddClubRefToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_reference :clubs, :weapon, null: false, foreign_key: true
  end
end
