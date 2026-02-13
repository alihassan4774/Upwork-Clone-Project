class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  # ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  # ## The multiple option can be set to true if you need users to have multiple roles.       ##
  # petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { client: 0, freelancer: 1 }

  # User create hone par profile bhi automatically create ho
  after_create :create_profile

  private

   def create_profile
      build_profile(
       email: email
      ).save
   end

   validates_presence_of :email, :name

  has_one :client_profile, dependent: :destroy
  has_one :freelancer_profile, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :proposals, foreign_key: :freelancer_id

end
