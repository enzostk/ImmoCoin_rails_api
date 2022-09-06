class Property < ApplicationRecord
  has_one :property_user
  has_one :user, through: :property_user
end
