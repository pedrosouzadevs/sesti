class CreateRods < ActiveRecord::Migration[7.0]
  def change
    create_table :rods do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
