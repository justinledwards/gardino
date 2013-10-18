class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :type
      t.integer :pin
      t.integer :number
      t.string :last_reading
      t.text :description

      t.timestamps
    end
  end
end
