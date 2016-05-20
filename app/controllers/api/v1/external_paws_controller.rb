class Api::V1::ExternalPawsController < Api::V1::ApiController
  def index
    @external_paws = ExternalPaw.all
    render 'index.json.jbuilder'
  end

  def create
    @external_paw = ExternalPaw.create(
      user_id: current_user.id,
      name: params[:name],
      breed: params[:breed],
      description: params[:description],
      image: params[:image]
    )
    flash[:success] = "Pet added!"
    render text: "OK"
  end

   def delete
    @external_paw = ExternalPaw.find_by(id: params[:id])
    @external_paw.delete
    flash[:success] = "Removed from Favorites"
    redirect_to '/paws'
  end

end