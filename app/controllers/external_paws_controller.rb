class Api::V1::ExternalPawsController < ApplicationController
  def index
    @external_paws = ExternalPaw.all
    render 'index.json.jbuilder'
  end

  def create
    external_paw_id = params[:external_paw_id].to_i
    user_id = current_user.id
    ExternalPaw.create(
      external_paw_id: paw_id,
      user_id: user_id
    )
    redirect_to '/external_paws'
  end
end
