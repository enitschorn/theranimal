class Animal < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
