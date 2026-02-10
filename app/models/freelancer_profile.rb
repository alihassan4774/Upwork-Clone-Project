class FreelancerProfile < ApplicationRecord
  belongs_to :user

  validates_presence_of :skills, :fixed_price, :portfolio_url
end
