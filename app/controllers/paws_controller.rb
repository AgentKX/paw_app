class PawsController < ApplicationController
  # before_action :validate!, :except => [:index, :show]

  def path
    if current_adopter 
      redirect_to '/adopters'
    elsif current_user
      redirect_to '/users'
    else
      redirect_to '/paws'
    end
  end

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
      name: params[:name], 
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
      location: params[:location],
      image: params[:image],
      adopter_id: current_adopter.id
    )
    flash[:success] = "Pet added!"
    redirect_to "/paws"
  end

  def edit
    paw_id = params[:id]
    @paw = Paw.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    paw_id = params[:id]
    @paw = Paw.find_by(id: paw_id)
    @paw.update(
      name: params[:name], 
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
      fees: params[:fees]
    )
    flash[:success] = "Pet Updated!"
    redirect_to "/paws/#{@paw.id}"
  end

  def delete
    @paw = Paw.find_by(id: params[:id])
    @paw.delete
    flash[:success] = "Pet Adopted"
    redirect_to '/adopters'
  end


  private

  def image_params
    params.permit(:photo)
  end

  def paw_params
    params.require(:paw).permit(:firstname, :description, :avatar)
  end


  # private

  # def validate!
  #   unless current_adopter
  #     flash[:warning] = "You do not have permission to edit this!"
  #     redirect_to '/users'
      
  #   end
  # end
end