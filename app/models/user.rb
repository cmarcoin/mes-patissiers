class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pastries, foreign_key: 'baker_id', class_name: 'Pastry'
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates_format_of :phone_number, with: /\A(0|\+33|0033)[1-9]([-. ]?[0-9]{2}){4}$\Z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
