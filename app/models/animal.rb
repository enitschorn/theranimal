class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :therapies
  has_many :reviews
  belongs_to :user

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
