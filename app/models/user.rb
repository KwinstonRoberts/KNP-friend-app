class User < ApplicationRecord
  has_secure_password
  has_many :activities
  validates :name,presence: true
  has_one :result, dependent: :destroy
end
