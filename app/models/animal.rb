class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :therapies
  has_many :reviews
  belongs_to :user

  def average_rating
    reviews = self.reviews
    reviews.each do |rating|
      ratings = @rating[animal.id]
    end
  end
end
