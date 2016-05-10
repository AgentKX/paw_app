class UsersController < ApplicationController
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

  def edit
    user_id = params[:id].to_i
    @user = User.find_by(id: user_id)
    render 'edit.html.erb'
  end

  def update
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    @user.update(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone: params[:phone],
      gender: params[:gender],
      has_yard: params[:has_yard],
      has_kids: params[:has_kids],
      employed: params[:retired],
      retired: params[:retired]
    )
    flash[:success] = "Info Updated!"
    redirect_to "/users/#{@user.id}/edit"
  end
  # def create
  #   Paw.create(
  #     shelter_name: params[:shelter_name],
  #     street: params[:street],
  #     city: params[:city],
  #     state: params[:state],
  #     zip: params[:zip],
  #     phone_number: params[:phone_number],
  #     email: params[:email],
  #     pet_name: params[:pet_name], 
  #     gender: params[:gender], 
  #     description: params[:description],
  #     breed: params[:breed],
  #     weight: params[:weight],
  #     color: params[:color],
  #     age: params[:age],
  #     special_needs: params[:special_needs],
  #     energy_level: params[:energy_level],
  #     needs_yard: params[:needs_yard],
  #     kids_ok: params[:kids_ok],
  #     fees: params[:fees],
  #     location: params[:location]
  #   )
  #   redirect_to 'paws/#{paw.id}'
  # end
end
