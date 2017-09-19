class Result < ApplicationRecord
  belongs_to :user
  has_many :personalities, -> { order(score: :desc) }
  has_many :traits
end
