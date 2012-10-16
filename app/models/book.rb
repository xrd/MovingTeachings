class Book

  def self.request_from_amazon( name )
    req = Vacuum.new :product_advertising
    req.configure do |c|
      c.key = 'AKIAIQ3IMU5UPJHQLUNA'
      c.secret = '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'
    end
    response = req.get query: { "Operation" =>  'ItemSearch', "SearchIndex" => 'Books', "Keywords" => name }
    response.body
  end

  def self.search( search )
    request_from_amazon( search )
  end
  
  def self.items( search )
    res = self.search( search )
    items = []
    res.find( 'Item' ) do |item|
      items << item
    end
    items
  end
end
