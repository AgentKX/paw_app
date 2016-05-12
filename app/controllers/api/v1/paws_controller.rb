class Api::V1::PawsController < ApplicationController
  def index
    data = Unirest.get("http://pets.vsapi01.com/api-search/by-url?url=#{params[:image_url]}&apikey=#{ENV['PET_API']}").body
    render json: data
  end
end
