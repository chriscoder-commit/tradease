class Listing < ApplicationRecord
  include Searchable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :picture, dependent: :destroy

  validates :price, numericality: { only_integer: true }
  validates :description, length: { in: 10..500 }
  validates :name, length: { in: 2..25 }

  scope :search_by_listing, -> (listing) { Listing.where('name ILIKE ?', "%#{listing}%") } 
  scope :search_by_min_price, -> (price) { where price: price.to_i..100000 }
  scope :search_by_max_price, -> (price) {where price: 0..price.to_i}
end
