class Listing < ApplicationRecord
  include Searchable

  #this is where the relations with other models are established
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :picture, dependent: :destroy

  #validations that restrict how inputs can be filled in
  validates :price, numericality: { only_integer: true }
  validates :description, length: { in: 10..500 }
  validates :name, length: { in: 2..150 }

  #these are the scopes form my three search bards, i.e. the name of the listing is like what is searched for, or the price is related to the ranges specified in 16 and 17
  scope :search_by_listing, -> (listing) { Listing.where('name ILIKE ?', "%#{listing}%") } 
  scope :search_by_min_price, -> (price) { where price: price.to_i..100000 }
  scope :search_by_max_price, -> (price) {where price: 0..price.to_i}
end
