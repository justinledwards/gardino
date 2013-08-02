class AddStatusToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :status, :string
  end
end
