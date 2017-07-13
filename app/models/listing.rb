class Listing < ApplicationRecord
  validates :name, :description, :accomodates, :bathrooms, :bedrooms, :beds, :price, :status, presence: true
  validates :property_type, :bed_type, :room_type, :pet_type, presence: true
  validates :name, uniqueness: true

  belongs_to :cancellation
  belongs_to :user
  belongs_to :address

  has_many :listing_images
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  enum property_type: [:house, :apartment, :guesthouse, :boat, :treehouse]
  enum room_type: [:entire_home, :private_room, :shared_room]
  enum bed_type: [:king, :queen, :double, :twin, :single, :couch]
  enum pet_type: [:no_pets, :cat, :dog, :cat_and_dog, :misc]
  enum status: [:pending, :active]
end
