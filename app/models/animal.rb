class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :therapies
  belongs_to :user

  def blank_stars
    5 - rating.to_i
  end
end
