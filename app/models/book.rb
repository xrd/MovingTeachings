require 'nokogiri'

class Book

  def self.request_from_amazon( name )
    req = Vacuum.new 
    req.configure key: 'AKIAIQ3IMU5UPJHQLUNA',
    secret: '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',
    tag: 'movingteachings'
    req.get query: { "Operation" =>  'ItemSearch', "SearchIndex" => 'Books', "Keywords" => name }
  end

  def self.search( search )
    request_from_amazon( search )
  end
 
end
