class Profile < ApplicationRecord
  #this is where the relations with other models are established
  belongs_to :user
  has_many :reviews

  #this enum essentially allows me to attach string words like welding to numbers in a nice drop down menu!
  enum skills: {
    " ": 0,
    "Carpentry": 1,
    "Welding": 2,
    "Landscaping": 3,
    "Plumbing": 4,
    "Electrician": 5,
  }

  #validation that restricts how inputs can be filled in
  validates :name, length: {minimum: 5, too_short: "%{count} is the minimum number of characters"}
end
