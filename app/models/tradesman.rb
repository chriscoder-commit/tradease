class Tradesman < ApplicationRecord
  #this is where the relations with other models are established
  belongs_to :user
  has_one_attached :certification
end

