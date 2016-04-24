class FavoritePaw < ActiveRecord::Base
  belongs_to :paw
  belongs_to :user
end
