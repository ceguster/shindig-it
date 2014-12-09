class Event < ActiveRecord::Base

  belongs_to :host, :class_name => "User"
  has_many   :invitations
  has_many   :contributions
  has_many   :guests, :through => :invitations

  after_destroy :delete_invitations, :delete_contributions
  validates_presence_of :name, :details, :date, :start_time, :location

  def menu
   menu = {}
    self.contributions.each do |c|
      menu[c.yummly_course] ||= []
      menu[c.yummly_course] << c
    end
    menu
  end

  def event_invite(user)
    @user = user
    Invitation.find_by(event_id: self.id, guest_id: @user.id)
  end

  def formatted_time
    @time = self.start_time
    if @time.hour > 11
      @ampm = "PM"
      @hour = @time.hour - 12
    else
      @ampm = "AM"
      @hour = @time.hour
    end
    if @time.min.to_s.length == 1
      @minutes = "0#{@time.min}"
    else
      @minutes = "#{@time.min}"
    end
    "#{@hour}:#{@minutes} #{@ampm}"
  end

  private
    def delete_invitations
      if self.invitations.count > 0
        self.invitations.each do |invite|
          invite.destroy
        end
      end
    end

    def delete_contributions
      if self.contributions.count > 0
        self.contributions.each do |c|
          c.destroy
        end
      end
    end

end
