class Prerequisite < ActiveRecord::Base
  belongs_to :dialectic
  attr_accessor :type
  attr_accessible :comment, :link, :ptype, :lat, :lng, :formatted_address, :icon
  validates_presence_of :comment, :ptype

  before_create :change_type_to_ptype

  def change_type_to_ptype
    if self.type
      self.ptype = self.type 
      self.type = nil
    end
  end
end