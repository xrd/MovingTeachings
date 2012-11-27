class Dialectic < ActiveRecord::Base
  belongs_to :user
  belongs_to :route
  has_many :prerequisites, :dependent => :destroy
  scope :approved, where( [ "approved = ?", true ] )
  serialize :times
  serialize :days
  attr_accessor :prereqs
  before_create :update_days
  after_create :add_prerequisites

  def add_prerequisites
    
    if self.prereqs
      self.prereqs.each do |p|
        if p
          logger.info "P: #{p.inspect}"
          self.prerequisites.create p.slice( :link, :comment, :lat, :lng, :formatted_address, :icon, :ptype, :name )
        end
      end
    end
  end
  
  def update_days
    only_selected_days = self.days.collect { |d|
      logger.info "Day: #{d.inspect}"
      d["selected"] == true ? d["name"] : nil
    }.compact
    logger.info "Selected: #{only_selected_days.inspect}"
    self.days = only_selected_days
  end
  
  def as_json(options={})
    options[:except] ||= :user_id
    options[:include] ||= []
    options[:include] << :route
    options[:include] << :prerequisites
    super( options )
  end
end
