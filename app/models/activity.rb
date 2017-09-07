class Activity < ApplicationRecord
  belongs_to :PersonalityType
  validates :name, presence: true
end
