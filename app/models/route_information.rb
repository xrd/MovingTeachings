class Route < ActiveRecord::Base
  validates_uniqueness_of :route_number, :scope => [ :direction, :route_description, :direction_description, :transport_type, :stop_sequence, :stop_id, :stop_name, :jurisdiction, :zipcode, :frequent ]
  validates_presence_of :location_id
  belongs_to :location
  has_many :stops
  
  def self.parse_node( location, node )
    stuff ={}
    node.css( "ExtendedData Data" ).each do |data|
      name = data['name']
      value = data.text().to_s.strip
      puts "#{name}: #{value}"
      name = "transport_type" if name.eql? "type"
      stuff[name] = value
    end
    coordinates = node.css( "Point coordinates" )[0].text().to_s.strip
    if coordinates
      pair = coordinates.split ","
      stuff['lat'] = pair[0]
      stuff['lng'] = pair[1]
    end

    me = find_by_route_number_and_direction( stuff['route_number'], stuff['direction'] )
    unless m
      puts "Creating new route for #{stuff['route_number']}"
      me = new
      me.route_number= stuff['route_number']
      me.direction = stuff['direction']
    end
    me.route_description= stuff['route_description']
    me.direction_description= stuff['direction__description']
    me.transport_type= stuff['type']
    me.jurisdiction= stuff['jurisdiction']
    me.frequent= stufff['frequent']
    me.location_id = location.id
    me.save

    me.stops.create kml_stop_id: stuff['stop_id'],
    sequence: stuff['stop_sequence'],
    name: stuff['stop_name'],
    jurisdiction: stuff['jurisdiction'],
    zipcode: stuff['zipcode']
   
  end
end
