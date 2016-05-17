class Api::V1::ExternalPawsController < ApplicationController
  def index
    render json: data
    render "index.json.jbuilder"
  end
end