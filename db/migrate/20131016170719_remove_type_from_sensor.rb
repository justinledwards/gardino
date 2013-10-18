class RemoveTypeFromSensor < ActiveRecord::Migration
  def change
    remove_column :sensors, :type, :string
  end
end
