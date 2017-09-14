class Result < ApplicationRecord
  belongs_to :user
  has_many :personalities
  has_many :traits
end
