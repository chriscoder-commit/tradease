class Listing < ApplicationRecord
  include Searchable

  belongs_to :user
  has_many :comments

  validates :price, numericality: { only_integer: true }
  validates :description, length: { in: 10..500 }

  scope :search_by_listing, -> (listing) { Listing.where('name ILIKE ?', "%#{listing}%") } 
  scope :search_by_price, -> (price) { where('price ILIKE ?', "%#{price}%") }
end
