class AddExtrasToPrereqs < ActiveRecord::Migration
  def change
    # {"formatted_address"=>"Maps, Lewis & Clark, Portland, OR 97219,
    # USA", "geometry"=>{"location"=>{"ab"=>-122.66892580000001},
    # "viewport"=>{"Z"=>{"b"=>45.4506516, "d"=>45.4507087},
    # "ca"=>{"b"=>-122.66895520000003, "d"=>-122.66890599999999}}},
    # "icon"=>"http://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png", "id"=>"3c1bf3e0bd9d5b30cfea5de63253a589586ec86f", "name"=>"Maps", "reference"=>"CnRrAAAAcsG_ZsmfhXWeUp0U_Ah4IQQPL9GURteZvVtcAhTRX6wPYAaLnPMMnQRCRFnXkLR5OK-UOX8hmpK0VsfbCbKZHg1R_2RzGzlOtZRqL935qprwH1IGegdbqOzISE_H8UVzH6K6YP4ECVyzc7I99CXxABIQAWIeKrv6WOuwzVSRcv7D5xoUS6nC1tYKEN7x_pR6cmC6ea3m-hA", "html_attributions"=>[], "expanded"=>{"shown"=>true}, "comment"=>"Hey, maps are here.", "lat"=>45.45067520000001, "lng"=>-122.66892580000001, "ptype"=>"map"}
    add_column :prerequisites, :formatted_address, :string
    add_column :prerequisites, :icon, :string
  end
end
