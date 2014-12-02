class User < ActiveRecord::Base
 
 #HOST METHODS
 has_many :events, :foreign_key => 'host_id'

 #GUEST METHODS
 has_many :contributions, :through => :events, :foreign_key => 'guest_id'



 def full_name
  "#{self.first_name} #{self.last_name}"
 end

end
