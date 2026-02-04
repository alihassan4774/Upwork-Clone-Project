class Profile < ApplicationRecord
  belongs_to :user


  validates :company_name, length: { maximum: 255 }
  validates :phone, length: { maximum: 20 }
end
