class Cd

	attr_reader :album, :artist
	@@all_cds = []

	def initialize(album, artist)
		@album = album
		@artist = artist
	end

	def save 
		@@all_cds << self
	end

	def self.all
		@@all_cds
	end

	def self.clear
		@@all_cds = []
	end

	def self.search_by_artist(artist_name)
		albums = []
		self.all.each { |cd| cd.artist == artist_name ? albums << cd.album : '***ARTIST NOT FOUND***' }
		albums
	end

	def self.search_by_album(album_name)
		artists = []
		self.all.each { |cd| cd.album == album_name ? artists << cd.artist : '***ALBUM NOT FOUND***' }
		artists
	end
end