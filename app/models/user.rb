class User < ActiveRecord::Base
  has_many :favorite_paws
  has_many :paws, through: :favorite_paws
  has_many :external_paws
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
