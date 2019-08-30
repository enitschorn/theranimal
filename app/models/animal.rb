class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :favorites
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

  def user_favorite?(current_user)
    favorite = Favorite.where(user_id: current_user.id, animal_id: self.id)
    favorite.present?
  end
end
