class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews

  enum skills: {
    "Carpentry": 0,
    "Welding": 1,
    "Landscaping": 2,
    "Plumbing": 3,
    "Electrician": 4,
  }

  validates :name, presence: true
end
