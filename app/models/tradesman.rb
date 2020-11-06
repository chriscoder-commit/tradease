class Tradesman < ApplicationRecord
  belongs_to :user
  has_one_attached :certification
end
