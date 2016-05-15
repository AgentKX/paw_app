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
end
