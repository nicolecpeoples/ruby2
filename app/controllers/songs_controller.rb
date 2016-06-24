class SongsController < ApplicationController

  def index
  	@songs = Song.all
    @song = Song.new
  end

  def create
  	@song = Song.new(song_params)

  	if @song.save
  		flash[:success] = "Song successfully added"
  		redirect_to songs_path
  	else
  		flash[:danger] = @song.errors.full_messages
       redirect_to songs_path
  	end
  end 

  def show
    @songs = Song.all
    @user = User.find(params[:id])
    @song = Song.find(params[:id])
    @playlists = Playlist.where(song: @song)
    
  end

  private
  	def song_params
  		params.require(:song).permit(:artist, :title)
  	end

end
