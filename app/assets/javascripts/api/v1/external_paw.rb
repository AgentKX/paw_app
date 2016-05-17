class Api::V1::ExternalPawsController < ApplicationController
  def index
    @external_paw = ExternalPaw.all
    render json :data
  end
end