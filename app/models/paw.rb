class Paw < ActiveRecord::Base
 
  
  belongs_to :adopters
  has_many :favorite_paws
  has_many :users, through: :favorite_paws
end
