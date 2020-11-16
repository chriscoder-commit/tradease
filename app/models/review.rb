class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :user

  validates :stars, presence: { message: "please leave a rating between 1-5" }
end
