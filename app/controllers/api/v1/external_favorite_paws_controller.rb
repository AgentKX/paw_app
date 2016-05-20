class Api::V1::ExternalFavoritePawsController < Api::V1::ApiController
  
  def index
    @external_favorite_paw = ExternalFavoritePaw.all
    render "index.html.erb"
  end

  def delete
    @external_favorite_paw = ExternalFavoritePaw.find_by(id: params[:id])
    @external_favorite_paw.delete
    flash[:success] = "Removed from Favorites"
    redirect_to '/paws'
  end
end