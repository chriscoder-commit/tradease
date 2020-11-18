class Review < ApplicationRecord
  #this is where the relations with other models are established
  belongs_to :profile
  belongs_to :user

  #validations that restrict how inputs can be filled in
  validates :stars, presence: { message: "please leave a rating between 1-5" }
end
