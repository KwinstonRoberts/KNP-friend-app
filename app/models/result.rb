class Result < ApplicationRecord
  belongs_to :user
  has_many :personalities, -> { order(score: :desc) }, dependent: :destroy
  has_many :traits
end
