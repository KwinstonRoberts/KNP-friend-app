class PersonalityType < ApplicationRecord
  belongs_to :user
  has_many :personality_type
end
