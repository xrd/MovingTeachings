require 'nokogiri'
namespace "movingteachings" do
  desc "Import Portland KML file"
  task :import_portland => :environment do |t|
    l = Location.find_by_name( "Portland, OR" )
    unless l
      l = Location.create( name: "Portland, OR" )
    end
    doc = Nokogiri::XML( open( "data/pdx/tm_route_stops.kml" ) )
    doc.css( "Placemark" ).each_with_index do |node, index|
      Route.parse_node( l, node )
    end
  end

  desc "Import SFMTA files"
  task :import_sfmta => :environment do |t|
    l = Location.find_by_name( "San Francisco, CA" )
    unless l
      l = Location.create( name: "San Francisco, CA" )
    end
    
    # agency.txt:  agency_id,agency_name,agency_url,agency_timezone,agency_lang
    # calendar.txt:  service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    # calendar_dates.txt:  service_id,date,exception_type
    # fare_attributes.txt:  fare_id,price,currency_type,payment_method,transfers,transfer_duration
    # fare_rules.txt:  fare_id,route_id,origin_id,destination_id,contains_id
    # routes.txt:  route_id,agency_id,route_short_name,route_long_name,route_desc,route_type,route_url,route_color,route_text_color
    # shapes.txt:  shape_id,shape_pt_lon,shape_pt_lat,shape_pt_sequence,shape_dist_traveled
    # stop_times.txt:  trip_id,arrival_time,departure_time,stop_id,stop_sequence,stop_headsign,pickup_type,drop_off_type,shape_dist_traveled
    # stops.txt:  stop_id,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url
    # trips.txt:  route_id,service_id,trip_id,trip_headsign,direction_id,block_id,shape_id

  end
end
