class Proposal < ApplicationRecord
  belongs_to :job
  belongs_to :freelancer, class_name: "User"

  validates :cover_letter, :bid_amount, :estimated_time, presence: true
end
