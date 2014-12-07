class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_mail

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

  def pending_events
    pending_events = []
    self.invitations.each do |invite|
      pending_events << invite.event if invite.status == "pending"
    end
    pending_events
  end

  def upcoming_events
    coming_soon = []
    self.invitations.each do |invite|
      coming_soon << invite.event if invite.status != "pending" && invite.event.date >= Date.today
    end
    coming_soon
  end

  def past_events
    past_events = []
    self.invitations.each do |invite|
      past_events << invite.event if invite.status == "Attending" && invite.event.date < Date.today
    end
    past_events
  end

    def send_welcome_mail
      @mail = UserMailer.welcome_email(self)
      binding.pry
      @mail.deliver
      binding.pry
    end
end