class Job < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy
end
