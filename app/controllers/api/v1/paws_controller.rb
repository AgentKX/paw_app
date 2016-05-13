class Api::V1::PawsController < ApplicationController
  def index
    data = Unirest.get("http://pets.vsapi01.com/api-search/by-url?url=#{params[:image_url]}&apikey=#{ENV['PET_API']}").body
    render json: data
  end

  def search_image
    image = Image.create(image_params)
    p image.photo.url
    imgur_session = Imgurapi::Session.new(client_id: ENV['IMGUR_CLIENT_ID'], client_secret: ENV['IMGUR_SECRET'], access_token: ENV['ACCESS_TOKEN'], refresh_token: ENV['REFRESH_SECRET'])
    account = imgur_session.account.account
    puts imgur_session.account.image_count
    image1 = imgur_session.image.image_upload(image.photo.url)
    p account
    redirect_to '/'
  end

  private

  def image_params
    params.permit(:photo)
  end
end
