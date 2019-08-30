class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :favorites, dependent: :destroy
  has_many :therapies
  has_many :reviews
  belongs_to :user

  scope :favorited_by, ->(username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }

  def average_rating
    reviews = self.reviews
    total = 0
    reviews.each do |review|
      total += review.rating
    end
    unless total == 0
      total / reviews.count
    else
      0
    end
  end
end
