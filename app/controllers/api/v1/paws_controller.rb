class Api::V1::PawsController < ApplicationController
  def index
    render json: data
  end




  def search_image
    @image = Image.create(image_params)
    p @image.photo.path
    # @imgur_session = Imgurapi::Session.new(client_id: ENV['IMGUR_CLIENT_ID'], client_secret: ENV['IMGUR_SECRET'], access_token: ENV['ACCESS_TOKEN'], refresh_token: ENV['REFRESH_SECRET'])
    # p @imgur_session
    # @account = @imgur_session.account.account
    # p @account
    # @image = @imgur_session.image.image_upload(@image.photo.path)
    # render json: {
    #   hello: 'hi'
    # }
    require 'imgur'
    client = Imgur::Client.new(ENV['IMGUR_CLIENT_ID'])
    image = Imgur::LocalImage.new(@image.photo.path, title: 'Awesome photo')
    uploaded = client.upload(image)
    data = Unirest.get("http://pets.vsapi01.com/api-search/by-url?url=#{uploaded.link}&apikey=#{ENV['PET_API']}").body
    render json: { data: data }
  end



  def image_params
    params.permit(:photo)
  end

end
