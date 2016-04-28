class PawsController < ApplicationController
  before_action :validate!, :except => [:index, :show]

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
      adopter_id: current_adopter.id
    )
    redirect_to 'paws/#{paw.id}'
  end

  def edit
    paw_id = params[:id]
    @paw = Paw.find_by(id: paw_id)
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

  private

  def validate!
    unless current_adopter
      redirect_to '/paws'
      flash[:warning] = "You do not have access."
    end
  end
end