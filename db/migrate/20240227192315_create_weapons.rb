class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :path
      t.integer :job

      t.timestamps
    end
  end
end
