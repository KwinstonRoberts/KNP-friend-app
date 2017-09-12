class User < ApplicationRecord
  has_secure_password
  validates :name,presence: true
  has_one :result, dependent: :destroy
end
