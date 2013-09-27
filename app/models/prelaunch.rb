# == Schema Information
#
# Table name: prelaunches
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prelaunch < ActiveRecord::Base

  attr_accessible :email

  validates :email,
            :presence => {:message => "Please enter your email address."},
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Please check your email address."}

  def is_unique?
    count = Prelaunch.where(:email => email).count
    if count == 0
      true
    else
      false
    end
  end

end
