class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :therapies
end
