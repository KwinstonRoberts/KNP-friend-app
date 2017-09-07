class Match < ApplicationRecord
  belongs_to :user
  validates :match_name, presence: true

end
