class Prerequisite < ActiveRecord::Base
  belongs_to :dialectic
  attr_accessor :type
  attr_accessible :comment, :link, :ptype, :lat, :lng, :formatted_address, :icon, :name
  validates_presence_of :ptype, :name

  before_create :change_type_to_ptype
  before_create :update_link
  
  def change_type_to_ptype
    if self.type
      self.ptype = self.type 
      self.type = nil
    end
  end
  
  def update_link
    if self.ptype and self.ptype.eql? "link"
      self.link = "http://#{self.link}" unless self.link =~ /^http/
    end
  end
end
