class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews

  enum skills: {
    " ": 0,
    "Carpentry": 1,
    "Welding": 2,
    "Landscaping": 3,
    "Plumbing": 4,
    "Electrician": 5,
  }

  validates :name, length: {minimum: 5, too_short: "%{count} us the minimum number of characters"}
end
