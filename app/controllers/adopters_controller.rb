class AdoptersController < ApplicationController
  
  # before_action :validate!, :except => [:index, :show]
  def index
    @adopter = Adopter.find_by(id: params[:id])
    if params[:search]
      @paws = Paw.where("lower(name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @paws = Paw.all 
    end 
    render 'index.html.erb'
  end

  def show
    @adopter = Adopter.find_by(id: params[:id])
    render 'show.html.erb'
  end

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

  # private

  # def validate!
  #   unless current_adopter
  #     redirect_to '/paws'
  #     flash[:message] = "You do not have access."
  #   end
  # end
end

