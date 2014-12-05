class Event < ActiveRecord::Base

  belongs_to :host, :class_name => "User"
  has_many   :invitations
  has_many   :contributions
  has_many   :guests, :through => :invitations


  def menu
   menu = {}
   menu_courses = self.contributions.collect do |c|
      c.yummly_course
    end.uniq!
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

end
