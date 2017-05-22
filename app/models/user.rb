class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pastries, foreign_key: 'baker_id', class_name: 'Pastry'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
