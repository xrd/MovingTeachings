class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :dialectic

  validates_uniqueness_of :user_id, scope: :dialectic_id
  validates_presence_of :user_id, :dialectic_id
  
  after_create proc{ update_favorited_count(1) }

  before_destroy proc{ update_favorited_count(-1) }
  
  def as_json( options={} )
    super( include: :dialectic )
  end
  
  def update_favorited_count( incr )
    count = self.dialectic.favorited_count || 0
    count += incr
    count = 0 if count < 0 
    self.dialectic.update_attribute( :favorited_count, count )
  end
end
