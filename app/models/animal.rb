class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :therapies
  belongs_to :user
end
