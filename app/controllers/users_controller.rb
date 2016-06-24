class UsersController < ApplicationController
include SessionsHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  	@users = User.all
  end

  def new
  end

  def edit

  end

  def create

  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		redirect_to songs_path
  	else 
		render 'main/index'
  	end
  end 

  def update
  	
  	if @user.update_attributes(user_params)
  		flash[:success] ="Profile Updated"
  		redirect_to @user
  	else
  		render @user
  	end
  end

  def show
  	@user = User.find(params[:id])
    @liked_songs = Playlist.where(user: @user).group("song_id")
    
  end

  def destroy
  	destroy_user
    flash[:success] = "Your account has been successfully deleted"
    redirect_to login_path
  end 

  private
   def set_user
   	 @user = User.find(params[:id])
   end 
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email,:password, :password_confirmation)
  end
end
