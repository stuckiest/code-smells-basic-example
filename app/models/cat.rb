class Cat < ActiveRecord::Base
  belongs_to :owner

  def full_details(show_all = true)
    "#{self.name} - #{self.age}"
  end

  def i
    "#{self.owner.name} - #{self.owner.age}"
  end
end
