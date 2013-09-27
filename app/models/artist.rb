# == Schema Information
#
# Table name: artists
#
#  id                    :integer          not null, primary key
#  first_name            :string(255)
#  last_name             :string(255)
#  percentage_of_revenue :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

    # == Schema Information
    #
    # Table name: artists
    #
    #  id                    :integer          not null, primary key
    #  first_name            :string(255)
    #  last_name             :string(255)
    #  percentage_of_revenue :integer
    #  created_at            :datetime         not null
    #  updated_at            :datetime         not null
    #

    class Artist < ActiveRecord::Base
      scope :order_by_username, order(:username)

      has_many :stickers
      has_many :brands, through: :stickers
      has_and_belongs_to_many :packs
      has_and_belongs_to_many :tags

      attr_accessible :first_name, :last_name, :percentage_of_revenue

      validates :first_name, :presence => true
      validates :last_name, :presence => true
      validates :percentage_of_revenue, :presence => true

    end
