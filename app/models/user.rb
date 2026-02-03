class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [ :client, :freelancer, :admin ], multiple: false)                                   ##
  ############################################################################################


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Yahan change kiya: 'role:' ki jagah ':role,' kar diya
  enum :role, { client: 0, freelancer: 1 }

  has_one :client_profile, dependent: :destroy
  has_one :freelancer_profile, dependent: :destroy






end
