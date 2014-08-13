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
end