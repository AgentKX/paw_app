class Paw < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  belongs_to :adopters
  has_many :favorite_paws
  has_many :users, through: :favorite_paws
end
