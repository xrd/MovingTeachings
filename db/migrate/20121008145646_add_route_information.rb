class AddRouteInformation < ActiveRecord::Migration
  def up
    create_table :routes do |t|
      t.string :route_number, :direction, :route_description, :direction_description, :transport_type, :stop_sequence, :stop_name, :stop_id :jurisdiction, :zipcode, :frequent, :coordinates
      t.integer :location_id
      t.timestamps
    end
  end

  def down
    drop_table :routes
  end
end
