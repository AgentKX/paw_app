class FavoritePawsController < ApplicationController
  def index
    if current_user
      @favorite_paws = FavoritePaw.where(user_id: current_user.id)
      @external_favorite_paws = ExternalPaw.where(user_id: current_user.id)
    else 
      redirect_to '/users/sign_in'
    end
  end

  def create
    paw_id = params[:paw_id].to_i
    user_id = current_user.id
    FavoritePaw.create(
      paw_id: paw_id,
      user_id: user_id
    )
    redirect_to '/favorite_paws'
  end

  def delete
    @favorite_paws = FavoritePaw.find_by(id: params[:id])
    @favorite_paws.destroy
    redirect_to '/favorite_paws'
  end

  def search_form
    search_term = params[:search]
    @paws = Paw.where("name LIKE ?", "%" + search_term + "%")
    render "index.html.erb"
  end
end


