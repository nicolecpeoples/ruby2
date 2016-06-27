class Song < ActiveRecord::Base
	has_many :playlists, dependent: :destroy	
    has_many :users, through: :playlists, source: :user
    
	validates :title, :artist, presence: true, length: { minimum: 2}

	def find_song(song)
		Playlist.where(song: song)
	end
end
