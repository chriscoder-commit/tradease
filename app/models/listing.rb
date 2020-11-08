class Listing < ApplicationRecord
  belongs_to :user

  validates :price, numericality: { only_integer: true }
  validates :description, length: { in: 10..500 }
end
