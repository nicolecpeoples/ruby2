class PlaylistsController < ApplicationController
	include SessionsHelper
	def create
		Playlist.create(user: current_user, song: Song.find(params[:song][:id]))
		redirect_to songs_path
	end
end
