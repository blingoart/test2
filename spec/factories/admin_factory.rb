# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :admin do
    username        'admin'
    email           'admin@admin.com'
  end
end
