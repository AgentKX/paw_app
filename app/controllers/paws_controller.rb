class PawsController < ApplicationController
  before_action :validate!, :except => [:index, :show]
  def index
    @paws = Paw.all 
    render 'index.html.erb'
  end

  def show
    paw_id = params[:id]
    @paw = Paw.find_by(id: paw_id)
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    Paw.create(
      shelter_name: params[:shelter_name],
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone_number: params[:phone_number],
      email: params[:email],
      pet_name: params[:pet_name], 
      gender: params[:gender], 
      description: params[:description],
      breed: params[:breed],
      weight: params[:weight],
      color: params[:color],
      age: params[:age],
      special_needs: params[:special_needs],
      energy_level: params[:energy_level],
      needs_yard: params[:needs_yard],
      kids_ok: params[:kids_ok],
      fees: params[:fees],
      location: params[:location]
    )
    redirect_to 'paws/#{paw.id}'
  end

  private

  def validate!
    unless current_adopter_user
      redirect_to '/paws'
      flash[:message] = "You do not have access."
    end
  end
end