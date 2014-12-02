class Event < ActiveRecord::Base

  belongs_to :host, :class_name => "User"
  has_many   :invitations
  has_many   :contributions
  has_many   :guests, :through => :invitations

end
