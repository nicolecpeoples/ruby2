class User < ActiveRecord::Base
	has_many :songs, through: :playlists, source: :song
	has_many :playlists, dependent: :destroy


  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2}
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  def get_count(user, song)
  	Playlist.where(user: user,  song: song)
  end
  
end
