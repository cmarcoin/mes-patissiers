class Review < ApplicationRecord
  belongs_to :order
  belongs_to :user
  validates :content, length: { minimum: 20 }
  validates :rating, presence: true
  validates :order_id, uniqueness: true
end
