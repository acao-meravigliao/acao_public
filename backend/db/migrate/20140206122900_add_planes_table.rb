
class AddPlanesTable < ActiveRecord::Migration
  def self.up
    create_table :planes do |t|
      t.timestamps
      t.string :uuid, :limit => 36, :null => false

      t.string :flarm_code, :limit => 16

      t.string :owner_name
      t.string :home_airport
      t.string :type_name
      t.string :race_registration
      t.string :registration
      t.string :common_radio_frequency
    end
    add_index :planes, :uuid, :unique => true
    add_index :planes, :flarm_code, :unique => true
  end
end

