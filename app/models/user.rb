class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  #  :recoverable, :rememberable, :validatable

  validates :email, presence: true

  has_many :property_users
  has_many :properties, through: :property_users
end
