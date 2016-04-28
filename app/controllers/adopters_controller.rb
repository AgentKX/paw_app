class AdoptersController < ApplicationController
  
  before_action :validate!, :except => [:index, :show]
  def index
    @paws = Paw.all 
    render 'index.html.erb'
  end

  def show
    @adopter = Adopter.find_by(id: params[:id])
    render 'show.html.erb'
  end

  # def new
  #   render 'new.html.erb'
  # end

  # def create
  #   Paw.create(
      
  #     business_name: params[:business_name],
  #     street: params[:street],
  #     city: params[:city],
  #     state: params[:state],
  #     zip: params[:zip],
  #     phone_number: params[:phone_number],
  #     email: params[:email],
    #   name: params[:name], 
    #   gender: params[:gender], 
    #   description: params[:description],
    #   breed: params[:breed],
    #   weight: params[:weight],
    #   color: params[:color],
    #   age: params[:age],
    #   special_needs: params[:special_needs],
    #   energy_level: params[:energy_level],
    #   needs_yard: params[:needs_yard],
    #   kids_ok: params[:kids_ok],
    #   fees: params[:fees]
    # )
  #   redirect_to 'paws/#{paw.id}'
  # end

  def edit
    adopter_id = params[:id]
    @adopter = Adopter.find_by(id: adopter_id)
    render 'edit.html.erb'
  end

  def update
    adopter_id = params[:id]
    @adopter = Adopter.find_by(id: adopter_id)
    @adopter.update(
      business_name: params[:business_name], 
      street: params[:street], 
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone: params[:phone]
    )
    flash[:success] = "Info Updated!"
    redirect_to "/adopters/#{@adopter.id}"
    
  end

  def delete
    @paws = Paw.find_by(params[:id])
    @paws.destroy
    redirect_to '/paws'
  end

  private

  def validate!
    unless current_adopter
      redirect_to '/paws'
      flash[:message] = "You do not have access."
    end
  end
end

