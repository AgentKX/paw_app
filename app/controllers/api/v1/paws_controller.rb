class Api::V1::PawsController < Api::V1::ApiController
  def index
    render json: data
  end

  def search_image
    @image = Image.create(image_params)
    p @image.photo.path
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
