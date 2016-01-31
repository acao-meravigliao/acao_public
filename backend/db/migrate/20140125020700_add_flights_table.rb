
class AddFlightsTable < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.timestamps
      t.string :uuid, :limit => 36, :null => false

      t.integer :acao_ext_id, :null => false

      t.references :plane_pilot1
      t.references :plane_pilot2

      t.references :towplane_pilot1
      t.references :towplane_pilot2

      t.references :plane
      t.references :towplane

      t.timestamp :takeoff_at
      t.timestamp :landing_at
      t.timestamp :towplane_landing_at

#      t.string :marche_aereo, :limit => 10
#      t.string :marche_aliante, :limit => 10

      t.integer :tipo_volo_club
      t.integer :tipo_aereo_aliante

      t.integer :durata_volo_aereo_minuti
      t.integer :durata_volo_aliante_minuti

      t.integer :quota

      t.decimal :bollini_volo, :precision => 10, :scale => 2

      t.boolean :check_chiuso

      t.string :dep, :limit => 64
      t.string :arr, :limit => 64

      t.integer :num_att
      t.datetime :data_att
    end
  end
end

