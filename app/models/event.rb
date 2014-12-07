class Event < ActiveRecord::Base

  belongs_to :host, :class_name => "User"
  has_many   :invitations
  has_many   :contributions
  has_many   :guests, :through => :invitations

  def menu
   menu = {}
   menu_courses = self.contributions.collect do |c|
      c.yummly_course
    end
    menu_courses = menu_courses.uniq
    menu_courses.each do |mc|
      menu[mc] = []
    end
    self.contributions.each do |c|
      menu.each do |k, v|
        if c.yummly_course == k
          menu[k] << c
        end
      end
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

end
