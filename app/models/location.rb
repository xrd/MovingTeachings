class Location < ActiveRecord::Base
  has_many :routes
  has_many :dialectics, through: :routes
  validates_uniqueness_of :name, :canonical_name
  scope :approved, where( :approved => true )
  before_create :set_approved_and_requested
  before_create :save_canonical_name

  def save_canonical_name
    self.canonical_name = self.name.downcase unless self.canonical_name
  end
  
  def set_approved_and_requested
    self.approved = false
    self.requested = 0
  end
  
  def bump_requested
    update_attribute( :requested, self.requested+1 )
  end
end
