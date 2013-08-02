class CreateRelays < ActiveRecord::Migration
  def change
    create_table :relays do |t|
      t.string :name
      t.integer :pin
      t.integer :number

      t.timestamps
    end
  end
end
