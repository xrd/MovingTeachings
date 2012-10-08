class AddStop < ActiveRecord::Migration
  def up
    create_table :stops do |t|
      t.string :name, :jurisdiction, :zipcode
      t.integer :location_id, :route_id, :sequence, :lat, :lng, :kml_stop_id
      t.timestamps
    end

    remove_column :routes, :stop_id, :stop_sequence, :lat, :lng, :zipcode
  end

  def down
    drop_table :stops
    add_column :routes, :stop_id, :string
    add_column :routes, :stop_sequence, :string
    add_column :routes, :zipcode, :string
    add_column :routes, :lat, :integer
    add_column :routes, :lng, :integer
  end
end
