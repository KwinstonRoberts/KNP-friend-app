class User < ApplicationRecord
  has_secure_password
  validates :name,presence: true
  has_one :result, dependent: :destroy
  has_and_belongs_to_many :activities
  has_many :messages
end
