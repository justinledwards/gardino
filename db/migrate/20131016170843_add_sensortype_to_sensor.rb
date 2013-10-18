class AddSensortypeToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :sensor_type, :string
  end
end
