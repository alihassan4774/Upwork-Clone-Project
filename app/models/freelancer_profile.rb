class FreelancerProfile < ApplicationRecord
  belongs_to :user

  validates_presence_of :skill, :fixed_price, :portfolio_url
end
