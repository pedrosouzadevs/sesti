class CreateEquips < ActiveRecord::Migration[7.0]
  def change
    create_table :equips do |t|

      t.timestamps
    end
  end
end
