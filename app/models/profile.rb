class Profile < ApplicationRecord
  belongs_to :user
 

  mount_uploader :image, ProfileUploader

  # validates_presence_of :email, :bio, :size, :vat_id, :timezone, :address
  validates :company_name, length: { maximum: 255 }
  validates :phone, length: { maximum: 20 }
end
