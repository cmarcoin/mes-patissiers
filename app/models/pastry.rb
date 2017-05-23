class Pastry < ApplicationRecord
  belongs_to :baker, class_name: "User", foreign_key: :baker_id
  has_many :orders
  mount_uploader :photo, PhotoUploader
end
