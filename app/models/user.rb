class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after_create :send_welcome_mail

 #HOST METHODS
 has_many :events, :foreign_key => 'host_id'

 #GUEST METHODS
 has_many :contributions, :through => :events, :foreign_key => 'guest_id'
 has_many :invitations, :foreign_key => 'guest_id'

 def full_name
  "#{self.first_name} #{self.last_name}"
 end

 #HOST method
 def hosted_events
  self.events
 end

 #GUEST method
  def invited_events
    self.invitations.collect do |invitation|
      invitation.event
    end
  end

  # private
  #   def send_welcome_mail
  #     @user = self
  #     UserMailer.welcome_email(@user).deliver
  #   end
end