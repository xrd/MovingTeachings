require 'nokogiri'
namespace "movingteachings" do
  desc "Import KML file"
  task :import_kml, [:doc,:location] => :environment do |t,args|
    if args.doc
      # puts "Processing #{args.doc} into location #{args.location}"
      #l = Location.find_by_name( args.location )
      l = Location.first
      doc = Nokogiri::XML(open(args.doc))
      puts "Processed XML, now parsing"
      doc.css( "Placemark" ).each_with_index do |node, index|
        puts "Processing new placemark #{index}"
        Route.parse_node( l, node )
        puts "Done"
      end
    else
      puts "Specify a filename to process for #{args.location}"
    end
  end
end
